import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:smart_courier_assistant_app/data/models/order_model.dart';
import 'package:smart_courier_assistant_app/ui/extensions/delivery_risk_extension.dart';

class PdfGenerator {
  static Future<File> generateOrderReportPdf(
    OrderModel order,
    BuildContext context,
  ) async {
    final orderDeliveryRisk = order.deliveryRisk.mapDeliveryRiskToText(context);
    final pdf = pw.Document();
    final robotoData = await rootBundle.load('assets/fonts/Roboto-Regular.ttf');
    final robotoFont = pw.Font.ttf(robotoData);
    final emoji = await PdfGoogleFonts.notoColorEmoji();
    final theme = pw.ThemeData.withFont(
      base: robotoFont,
      bold: robotoFont,
      fontFallback: [emoji],
    );

    pdf.addPage(
      pw.Page(
        theme: theme,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Order #${order.id}',
                style: pw.TextStyle(
                  font: robotoFont,
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 8),
              pw.Text(
                'Client: ${order.clientFullName}',
                style: pw.TextStyle(font: robotoFont, fontSize: 16),
              ),
              pw.Text(
                'Phone: ${order.clientPhoneNumber}',
                style: pw.TextStyle(font: robotoFont, fontSize: 16),
              ),
              pw.Text(
                'Address: ${order.address}',
                style: pw.TextStyle(font: robotoFont, fontSize: 16),
              ),
              pw.SizedBox(height: 8),
              pw.Text(
                'Deliver by: ${order.deliveryBy}',
                style: pw.TextStyle(font: robotoFont, fontSize: 16),
              ),
              pw.Text(
                'Planned ETA: ${order.plannedEta}',
                style: pw.TextStyle(font: robotoFont, fontSize: 16),
              ),
              pw.SizedBox(height: 8),
              pw.Text(
                'Status: ${order.status}',
                style: pw.TextStyle(
                  font: robotoFont,
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                'Delivery risk: $orderDeliveryRisk',
                style: pw.TextStyle(font: robotoFont, fontSize: 16),
              ),
            ],
          );
        },
      ),
    );
    final downloadsPath = '/storage/emulated/0/Download';
    final file = File('$downloadsPath/order_${order.id}.pdf');
    await file.writeAsBytes(await pdf.save());
    return file;
  }
}
