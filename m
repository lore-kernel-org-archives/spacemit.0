Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195217;
	b=s6u9Wh+w9yUhgxq9ixzyNqBdGcZTJnJWO/5fYwkB2l2uHlTO5PKu35UUVYw9+t2wsBkU
	 s+8L9eq377Jjw1UhQ2ybbomFuXcjh2HWUBOokhR5BeuuBCjMWOkmPMRiEhkUzy0CHx3tj
	 tUmhVqKakGjbiJzIJUMRhojHOHkR3RPb9cj6OVNsgoyXFd/8c2nFkuIOYo4ndfxu+0VrJ
	 5zpu2/Tu+VzVECVYQd/RgeHuPFhNmOY0zI9pyo/txoUeQYP8vFgXS7bZoPw5MX2savNIE
	 hqKpagU/twZtA9Zf782YUakNPPlaqJuWCX5ossh/ftorTUhGWW7oN26K60+Ea1jNNiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195217;
	h=DMARC-Filter:DKIM-Signature:X-Mailer:X-Original-From:From:Subject:
	 Content-Transfer-Encoding:To:X-Lms-Return-Path:References:
	 Content-Type:Date:Message-Id:Mime-Version:In-Reply-To:Received:Cc;
	bh=VBxjSeMIQblJqurQ7NVd7kOa1gruW2oug+/iX2zAqdk=;
	b=V1OAt/QswYQtzvlMEJ7w71R4JYJCl7v+PRjQgsVtrZ/Hc9iT+mWUj2LjvxkjCSX3QftV
	 EEKIFjadAJ5IYgaYO6P1rOfePtjlsxyeVUzDirzUIQU2XjCJlvaqOd7UjeGNYsalfCyad
	 Q5fb6NmcyiJFPnwWeYrY5AJMz2Kd/mRW59GNWepnQURoGQJcCGxNbyiO3vRORmKpfIwOU
	 Eo7lEa4z/x1mQ7t4q/a/EfIzYAYdIxpl7uStssv83jgI82vkWG0gQLBjQM3XDMePkKzZP
	 4N5m6Vf1IJdFpa44w3HsZ6+O1AYcYSUPmgEKowRsTAoV285ErQAD4nsPMa3mnMVZdpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=esE0u41P;
	arc=none smtp.remote-ip=209.127.231.38
Received: from va-2-38.ptr.blmpb.com (va-2-38.ptr.blmpb.com [209.127.231.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E9C606A31C
	for <spacemit@lists.linux.dev>; Mon,  9 Nov 2026 03:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7E9C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=esE0u41P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794195214;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=VBxjSeMIQblJqurQ7NVd7kOa1gruW2oug+/iX2zAqdk=;
 b=esE0u41Pb8rckUzhBjQ1QCK7b1ymVbZgSCn6wU5+/Y0XHkGrlc2sFF7atQaaXV4IlD3yEK
 /KPcxeMj+7YrUYn+eQE3e2cxaqRKv5eeFKUlzW53g9ZHzf6JIC5NVxPN2qLm/rxHPm3+ft
 uEt5nzIpWppR8azA5qcR+rGVDvFdBvMaFzRlKgBs3qwVTsh/17hyJkgBq0T+UK7pLgKt9Q
 VvE97gcje2o6ytF/+81aYnPSr5PtcsRsqs42VFTg+pALWLNTplTfelh5yFWGv1KYCE0emT
 YHvHBxjdXCYU3GAOH/9ILg0yW0xRrDH6XTpCvrAcEQjGJEuamUtIv240JiOKgg==
X-Mailer: git-send-email 2.43.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v4 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
Content-Transfer-Encoding: 7bit
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
X-Lms-Return-Path: <lba+26af13f03+4cfeaa+lists.linux.dev+sandie.cao@deepcomputing.io>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Date: Mon,  9 Nov 2026 11:33:10 +0800
Message-Id: <20261109033310.361435-1-sandie.cao@deepcomputing.io>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 09 Nov 2026 11:33:22 +0800
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>

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
