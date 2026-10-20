Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484378;
	b=DVqTw/07dfPohew6ZKT0ngaR46QOyEHZp6SDzlLmuPj0BKBYf4r4x8dZ3aQagjDmC5tY
	 7mWtPnc+V0Z+U5KgpYGLc6NJkYq2Ki3aeBUGFl/0tFwE7cQfpbZs7ZGOK6WxU1mLRODa9
	 b3W5iM93tuwl7kPq8mGwUyVUxuWB0etSEGo8Jo19cfrJp9VaNRd8nS4w4ksDCB17PHBU0
	 s1a1yxeIP2gg1XBtrsRKKoQNUVjIvHJ9sFyye4nTOS9HivWYFCWcJ3iMdqSvZMWYGuUZH
	 0TJ3+JfveDlNz7MAu8nN5kJdpHUVA/GXzIDm9OepXzAASjAb5YmfuKiZxBiY8ZYQKeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484378;
	h=DMARC-Filter:DKIM-Signature:To:From:Message-Id:In-Reply-To:
	 X-Lms-Return-Path:X-Mailer:Cc:Date:Mime-Version:X-Original-From:
	 Content-Transfer-Encoding:Received:Subject:References:Content-Type;
	bh=1RdRWFhku22lQfv1esybG7dBMJhACY2UvYQ+lxBr1Ak=;
	b=frw57Uin/jKhFP+t6bxviTeKDFaD76GqvNlt0PLTNpIAgV97xStpH5GG1g5Pc9zLQ0JH
	 LdmLp2zBZoOGO1NeQcjyBqPUlCMkzzjOb0sleWty3xrJM8cTBQaJi4D8VP2xjXwUtEaxC
	 EdClhdjKpnfb4jdWkj/WFIlIZsxxgOiS1EgaIn09MQHnNKhJuv79y5TXnNCCQRurnXwPi
	 GRPV3uMhMyzjtAFf21nfvxW0QP0ETfpNVqUOWMVebn4tqQpJk54HZXVp3/eFHADQtnFSw
	 LldvwyQS/ZNQGoBrj7o2U0Eevkdz/qH49IU5fc7GtptBNxq3eFsKoyqqlV3a5J7/H/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=wtfDBOop;
	arc=none smtp.remote-ip=209.127.231.36
Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D72F606A319
	for <spacemit@lists.linux.dev>; Tue, 20 Oct 2026 08:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D72F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=wtfDBOop
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1792484373;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=1RdRWFhku22lQfv1esybG7dBMJhACY2UvYQ+lxBr1Ak=;
 b=wtfDBOopU+ssOEp+zY5mGi/B2uCl3lskzW6GARriglK6Kdw/oM0P+Z6HsAOVsjRZCmJbG1
 o1jhtfOlldqjwJ79T7rDq7ws2I502x/AL2sHUN+kpwcVI/1qMWrg9RIEnw1PqfuMXyScJ+
 TWI8+JMPlq8JupvXnsgKTSpnVNdbtV8GjhocV+1hopY+X27Ztd2wwSmazFmhOy0YaassFT
 H4hj9POfdTPKlB8TmrOZeS0x6dn2E1lj6dGBAV7sxb1NHGz6sZblni9ivJkbKY1loYtebZ
 cp9T8Bp+Gciz+1fKDvlv1NL/Og3CSIoKogdmixIqgGSNs09yV+VOXOf/p5Qz4Q==
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20261020081916.3673743-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26ad72412+ad0078+lists.linux.dev+sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Tue, 20 Oct 2026 16:19:16 +0800
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([14.155.180.235]) by smtp.feishu.cn with ESMTPS; Tue, 20 Oct 2026 16:19:29 +0800
Subject: [PATCH v2 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
References: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8

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
