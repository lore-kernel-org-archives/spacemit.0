Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599318;
	b=RN97xx0TxQQkPbFlMo+SCxcjdH93RWIcZRQnhusRp0gQdWNqPVtZbzzMtZPhI7o+xsAK
	 D9soMT4H22qtsKH1rcAhR1dBqXwu+aLY+tDyJEdveCZ0l/RuxmT+H2+Vb47J46w+w2t4x
	 H+uHo08EhamCnlpp/jKhAw1NzEOSReFLG78rKKuDnuj+laaFif9p7uJlq9iQAmvsWrKKN
	 JvbjaQr1p4bc/ZsOmhXMRAuNF8bbTgGFumiFNJkXW02b4Xfe9+B6RMFiX3qhLUVt/etW+
	 P0r/djWstaH8oe9WjyM5mN/CEPRKdxAi3PBeA/8RjzMaJI7VrCNDN1dPbz/1zPBDydg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599318;
	h=DMARC-Filter:DKIM-Signature:Content-Type:To:Cc:From:Message-Id:
	 In-Reply-To:Subject:Date:X-Original-From:Received:
	 Content-Transfer-Encoding:X-Lms-Return-Path:References:Mime-Version:
	 X-Mailer;
	bh=1RdRWFhku22lQfv1esybG7dBMJhACY2UvYQ+lxBr1Ak=;
	b=FLdQApLCyDpm6Dn9SisDk4tTRtw3OCqjCcjGOTO+4tbq1yYW8EHBLV8oCAdREcLZOmM1
	 gPs6tJPAoMZ2a3da6iObTzlXhj2PvtL5G3u7KTKPlcdJDtYb/McuvcKpNTdjDbrLHnfLi
	 PBCM/ZFltIa2Du6FMprbLVMnW3k2C9WLZXbYSnWte/ZY+VgezU8zmQxrbCe2ADNLxgVQs
	 ho9cF8EYkvt0hxunBZv11raSx1ER49cdZJI5lCnPza5vToCz9Yg8N/cudY3qS6/c5xLgv
	 DvQqVjouDhZ75ud0bqAjZcIHpLoPckm1lxWEesh/w4Lx2yWefpZKgPJc1Y7FB98AHJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=YhnpqIGH;
	arc=none smtp.remote-ip=209.127.231.35
Received: from va-2-35.ptr.blmpb.com (va-2-35.ptr.blmpb.com [209.127.231.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C44D606A329
	for <spacemit@lists.linux.dev>; Mon,  2 Nov 2026 06:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C44D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=YhnpqIGH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1793599315;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=1RdRWFhku22lQfv1esybG7dBMJhACY2UvYQ+lxBr1Ak=;
 b=YhnpqIGHWXgickEq4ygNIxcBk3zUPyJGr4YZ2uXzL+16yx0soIScH4BdGsOHfY4DaJAf1D
 v3SkWp0BDE8vrbsdg39sTK3siGJLQakoWVXcn6qE086ltZAOx8sEvrf1DA3LDscxZ4dv17
 JvTHKDQuIfvoIp/HEgY4wDP5OYTQU50BcgejpIe+c9rYw9cDKm1Vve74GPj4N7WWW5ns+t
 Vm0xmkyV3Chq2OeIN6kulJM1cJPE+poKsi70eMHdYC5CyWjIHKPywIsFltSfM9NEZdGG1X
 MJvskpzLsP7T6SSEg+tLiCJ/WL8tGGpSjLTzrVV+iGYCaEQ5UgvdqoiRn8AnHA==
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20261102060136.100662-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
Subject: [PATCH v3 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
Date: Mon,  2 Nov 2026 14:01:36 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([113.80.9.210]) by smtp.feishu.cn with ESMTPS; Mon, 02 Nov 2026 14:01:41 +0800
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26ae82746+7da20c+lists.linux.dev+sandie.cao@deepcomputing.io>
References: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0

Add USB device node (b, c, d) to DeepComputing FML13V05 board.
USB A works on otg mode, it isn't configured currently.
- 4 USB-C Ports
     - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
     - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
     - Port 3 & 4: USB 3.2 Gen 1

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 804abc85602a..84f66dd8f962 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -179,8 +179,58 @@ dldo7: dldo7 {
 	};
 };
 
+&combophy {
+	spacemit,apmu = <&syscon_apmu 0x17>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
 	status = "okay";
 };
+
+&usb2_host {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	hub@1 {
+		compatible = "usb5e3,608";
+		reg = <1>;
+	};
+};
+
+&usb2_phy {
+	status = "okay";
+};
+
+&usb3b_u2phy {
+	status = "okay";
+};
+
+&usb3b {
+	phys = <&usb3b_u2phy>, <&combophy 2 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+};
+
+&usb3c_u2phy {
+	status = "okay";
+};
+
+&usb3c {
+	phys = <&usb3c_u2phy>, <&combophy 3 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+};
+
+&usb3d_u2phy {
+	status = "okay";
+};
+
+&usb3d {
+	phys = <&usb3d_u2phy>, <&combophy 4 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+};
-- 
2.43.0
