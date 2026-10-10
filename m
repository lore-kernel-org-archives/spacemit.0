Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0803B2EEE65
	for <spacemit@lists.linux.dev>; Sat, 10 Oct 2026 02:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791597924; cv=none; b=BssaEzkWSiu6qMlXORC1F+bpxqMq5HaEEmwTLINllxEnIZ7Aql+UN0iuoPzqXDBZf5lD1Wt6w7IxyPF8BK0WIktTWo//6AKcAfOeOtAMMLSrUqNSh/h6Al5J/EnQ/4sbqCano8mutEmvMl3c46Wov1IukxEeHG54wBoi9Z7f1go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791597924; c=relaxed/simple;
	bh=RtNJ+XWJK6eSr1fba8eizstY+FWi1d6ftiywfKe/zuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qXljC7tGrqKn41umznJzAIQbrxaqS2xbjuW+RHc/606Qx/1k77JEHa4ucQs4d0PXOQ1lZIh5Ft0jwKIJv5wL/e1RPwlfUlNu+7ARwitFFQhuauI2UM1xXAVmO4s1znQu7MGp/yRyvSYVCadRlDoXFycKf8fFnwPgoeZhZD+nsG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hOtEhzmC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hOtEhzmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791597922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w+tGYwl2znmnp8WIdQYcLZIZyvGyAsTyeavLHMYpyQU=;
	b=hOtEhzmCY/ZKnh+rUNiNg7rcdzRwmnyoFiXw74tGLLedC9F6PwQ05K5XCB1sCaxifTtlvQ
	ti8+EbpIMz0ElFvSQ4mDAtfL4OJVtFsOO0sjTX/3Y8TWJKp4haMRG/O/JIWV/yn3uSIs2S
	83KvWvL69WAtJ/8b2NJDN0twwtag3Go=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-MvnWXc8xOtmJ6EktMncK3A-1; Sat, 10 Oct 2026 02:05:20 +0000
X-MC-Unique: MvnWXc8xOtmJ6EktMncK3A-1
X-Mimecast-MFC-AGG-ID: MvnWXc8xOtmJ6EktMncK3A_1791597920
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8adfca4de94so3558147b3.1
        for <spacemit@lists.linux.dev>; Fri, 09 Oct 2026 19:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791597920; x=1792202720;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w+tGYwl2znmnp8WIdQYcLZIZyvGyAsTyeavLHMYpyQU=;
        b=cITVTbVUJAWn6JZKWaPXiVamCAe9OqY6qM23waVIrhkCVRNWBL6KmTijwnxmuwhVq6
         oGMHPdDsQ2Dx0NryvPsL7wdKDnKH6RajwmGzQ7bZojdeWasmIAB6ApNNu2qnoQ3fr8K7
         Bau5+R9TehwtJOv3tPT9R9wB36OBdBJhzEJwFsvKagy0pTtG1L8/NUpLc9/rNpGfyamu
         58xSheEz7ZG2GUwiiAEIugguiFcM+VvjqZpMFiObsCx4oCjgawE8vx+r/i+pXKIWgWd3
         sMyZOF4g/OHKYCpbINFwl/QSjZ3JXx7z3wG6eQA3VtFNjoroeO5Nqw+42GbuTkX1aZK8
         Nlxg==
X-Forwarded-Encrypted: i=1; AKwUvBzrmVyOlm1c/fvmxsV/+CHxni3jQgQcwDUcUH8MpkPypen9WVTR1/59qggaByBlRqxuHV9jJUcIUA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJUDq+4D10kKjSwdXiPCo1OGXjUFkPZCoCwEJmlwBi0lNyH/kSS
	y+edZn5pcd05ZV5RXG7o/IBic/hd064+KSRetJTlqRtLqsJHLDFB2UcHNCyXs4y6kBrDtNJlB8F
	zhTcHmM1QQKlq5vhPRuzfuNDzp9L2iWbSf0u6Cly15Jcz4gysXikvzE3gfJSc
X-Gm-Gg: AYBFou19D4q55qLgRepU1xL8ln0v91aiGFj3pZQjhBOPERkIjLudsCoEWigkXIZwsle
	RR0ccg1Ge9kSUAyp1jXB1zafalihzYZ4ea+jB8iPlGMCpsM25tlBq9wjCQ8zoUaAKmV977E7GjA
	fuovgX2p+b/KkIY6Ruak7sZuRf85I6ldFlakkl0P+3rvh9NcS7yLAJlO4cftNbxkNIMCPHmkGc6
	r+/eJp9uAmssxDP/4bhh/KQeaVq/QUe2m01JyXiQy+gm2g4CYNJ7Y9imoRa6bDDvAn1PrmKaoty
	Ot7vNLOQp4QHu1X9gr704yPfffX4OTkDrgau/w1fIXQ4RtacZhL4
X-Received: by 2002:a05:690c:4d81:b0:8ae:6740:999 with SMTP id 00721157ae682-8b07ed90a18mr10609317b3.20.1791597919979;
        Fri, 09 Oct 2026 19:05:19 -0700 (PDT)
X-Received: by 2002:a05:690c:4d81:b0:8ae:6740:999 with SMTP id 00721157ae682-8b07ed90a18mr10609237b3.20.1791597919575;
        Fri, 09 Oct 2026 19:05:19 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07ee8c257sm14463027b3.3.2026.10.09.19.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:05:18 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH] riscv: dts: spacemit: enable USB2.0 controllers on Milk-V Jupiter
Date: Fri,  9 Oct 2026 22:03:17 -0400
Message-ID: <20261009-jupiter-usb2-v1-1-ab84a00d3b64@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Change-ID: 20261009-jupiter-usb2-b888e544520a
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OVXQg20bkToSHX5pamq8kkTBAmtkMeu5J0NndDlT_bQ_1791597920
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Milk-V Jupiter boards, usb2_0 is connected to a Type-C connector
which cannot act as a power source. That port can act as USB host if
connected to a self-powered hub.

usb2_1 has vbus output controlled by gpio 127 and is connected to a
FE1.1s hub, which drives four ports: two rear Type-A receptacles and a
9-pin header for two chassis ports.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
This patch depends on
https://lore.kernel.org/spacemit/20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com/

This conflicts with the Jupiter M1 patch set but can be applied on top
of it if all instances of "k1-milkv-jupiter.dts" in this diff are
replaced with "k1-milkv-jupiter-common.dtsi"
---
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 635e95aad14a5..913c2170bf6a2 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -82,6 +82,16 @@ reg_vcc_5v: regulator-vcc-5v {
 		vin-supply = <&reg_dc_in>;
 	};
 
+	reg_usb2_vbus: regulator-usb2-vbus-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB20_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc_5v>;
+		gpio = <&gpio K1_GPIO(127) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	regulator-usb3-vbus-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "USB30_VBUS";
@@ -443,10 +453,35 @@ &uart0 {
 	status = "okay";
 };
 
+&usbphy0 {
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
+
 &usbphy2 {
 	status = "okay";
 };
 
+&usb2_0 {
+	status = "okay";
+};
+
+&usb2_1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	vbus-supply = <&reg_usb2_vbus>;
+	status = "okay";
+
+	hub_2_1: hub@1 {
+		compatible = "usb1a40,0101";
+		reg = <1>;
+		vdd-supply = <&pcie_vcc_3v3>;
+	};
+};
+
 &usb_dwc3 {
 	dr_mode = "host";
 	#address-cells = <1>;

---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20261009-jupiter-usb2-b888e544520a
prerequisite-change-id: 20260812-b4-spacemit-k1-usb2-97adfc283d58:v4
prerequisite-patch-id: ccc56cd7363a39566f74b3628fbe2ccf01c76774
prerequisite-patch-id: ee646b8712bc41793579b8abc30d8d3f616d36e7
prerequisite-patch-id: 793abd51f18ae96cc2cbcb447721ca9ae1e6fa49
prerequisite-patch-id: 67bf74a44fd81390c82c07921d808a58a5211fb7
prerequisite-patch-id: 801c65013a1e55dfdbf3d3b061752ddb972afb18
prerequisite-patch-id: 2321f949dcfb2609932da94cabc969812f11669f
prerequisite-patch-id: 0843cac1ae192e99f2562f5ac882dfc4f9a10637
prerequisite-patch-id: 7ce394f4284c628b7d6187d8ee555726c94675ad

Best regards,
-- 
Jennifer Berringer <jberring@redhat.com>

