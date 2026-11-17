Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894365;
	b=YJvlmYRi2ANUm2b6bYXvuWqJjMi185uw4UFspt8BIxiHj4FRx5iH/BAQTtveOCPsmQJu
	 j0cY5h4FEKuY32rp2a3XDeuvM9VbvqzzImPs/FX6pmOosaYEijkDDoVzvF/4gpADXwGkC
	 Gottz2ew4GcBV97eXDdN3TMWMKKOrKCEa1SzXL9RB8OqYQ2LO6ozIDd9sBsQgEeED2tVq
	 RAe9O2PM0SSwQ5NbvCnPiswwVstTa0zmetEVyG3L04D3R3PunyaJhy76KPbbXD4MtDIAU
	 FSpqWRRwKLBCpqd68evXslqNdIs6zNlFuIVpYiSbmhd6idQR1xb3dKHdnn3AAeTJsmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894365;
	h=DMARC-Filter:DKIM-Signature:References:Cc:From:X-Original-From:
	 Message-Id:Mime-Version:Received:To:Subject:Date:X-Lms-Return-Path:
	 Content-Transfer-Encoding:Content-Type:In-Reply-To:X-Mailer;
	bh=hDxJlFjhA2xRUr2x1bmOReaNiq2zOT9aXD0eY3fwdsI=;
	b=eZ+YRray8CfOEmmzQYpJB4/wgx9FG6baK5ttCRc5EZNjSy5dOgPYDlTpfQ1t1gNGPmQi
	 HknSe0KWvXrCZmeC84dRg6Gkf/uN0asfgR6v/zBP/lgLRhohlPx5lcePIwQOJq1/rxXL0
	 ZolgMItpa7i4hwCTG6H1wVHTYqvfek/L0qIbIsrMDh3lFURR/q0Tp9Vkw+33nhcteyqfW
	 1vZcgTjdWi0jDx71RWYQ8yhNhSlYglb+nhbhU6snt6kJpgyHRjpkyF0PfDuMDYWlWxF3J
	 nN3SUh4MOOLkOxWjarnC1ucvm/BZJGA+qwsO1ShrCcg9Z29QHPBcDyXHIWINt6gozdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=0l3gt0RT;
	arc=none smtp.remote-ip=209.127.231.37
Received: from va-2-37.ptr.blmpb.com (va-2-37.ptr.blmpb.com [209.127.231.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470F1606A32C
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 05:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 470F1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=0l3gt0RT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794894360;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=hDxJlFjhA2xRUr2x1bmOReaNiq2zOT9aXD0eY3fwdsI=;
 b=0l3gt0RTg0KqTKecsXluooHrvyDXvMsfs1Z5fFcj7Ksq2qK8/g6PXrEaj9uRqatoEpML4K
 gcJ/2+d6cy2clxeLACIsk67aFYn6ExYwJKkat0q/UKp2tive2+6vkaku6/BgneF7bpTlZ6
 btwfHPWGKrc9p6lpu7cxDopEus3v0SGWQTf7TjdNvqcbYc2hlnybuvYf9lF6qxf9MJ8nBc
 vrNGXkgzZy+8UFzyh+ayw2rDjcrvXQsq2pu0AeYPneVTQX8SbS/blaEdaBzD0IltenTOB1
 1NKErhbgMLGVMfm3bThc9oVZhlEHZZHyeeN/ikzXDlzpXhdBKWR10MPVAi8bKw==
References: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Message-Id: <20261117054551.1048819-1-sandie.cao@deepcomputing.io>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Tue, 17 Nov 2026 13:45:57 +0800
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Subject: [PATCH v5 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
Date: Tue, 17 Nov 2026 13:45:50 +0800
X-Lms-Return-Path: <lba+26afbea16+6806dd+lists.linux.dev+sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0

Add a USB 2.0 hub under the USB 2.0 controller node, to which devices such
as the USB Bluetooth, USB fingerprint and USB camera are attached.

Add USB 3.0 device node (b, c, d).
     - Port b: PD 3.0 (65W Max), USB 3.2 Gen 1
     - Port c: USB 3.2 Gen 1
     - Port d: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index e061233c15a3..bcd533484a73 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -172,8 +172,58 @@ dldo7: dldo7 {
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
