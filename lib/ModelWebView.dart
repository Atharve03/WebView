class ModelWebView {
  WebViewData? webViewData;

  ModelWebView({this.webViewData});

  ModelWebView.fromJson(Map<String, dynamic> json) {
    webViewData = json['WebViewData'] != null
        ? new WebViewData.fromJson(json['WebViewData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.webViewData != null) {
      data['WebViewData'] = this.webViewData!.toJson();
    }
    return data;
  }
}

class WebViewData {
  String? contentType;
  String? htmlContent;
  String? backgroundColor;
  double? scaleSize;
  String? link;
  double? padding;
  double? margin;

  WebViewData(
      {
      this.contentType,
      this.htmlContent,
      this.backgroundColor,
      this.scaleSize,
      this.link,
      this.padding,
      this.margin});

  WebViewData.fromJson(Map<String, dynamic> json) {
    contentType = json['ContentType'];
    htmlContent = json['HtmlContent'];
    backgroundColor = json['BackgroundColor'];
    scaleSize = json['ScaleSize'];
    link = json['Link'];
    padding = json['Padding'];
    margin = json['Margin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ContentType'] = this.contentType;
    data['HtmlContent'] = this.htmlContent;
    data['BackgroundColor'] = this.backgroundColor;
    data['ScaleSize'] = this.scaleSize;
    data['Link'] = this.link;
    data['Padding'] = this.padding;
    data['Margin'] = this.margin;
    return data;
  }
}