Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC783D6488
	for <spacemit@lists.linux.dev>; Wed, 13 May 2026 07:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656810; cv=none; b=teevZdXbwwvGGuUt9n49kb6ZXnST9Ri0el/wJYsi1UvkJuXhIzKF/PxuvV1Mt/jMTbpvOLi4iNZkV+BXr2rZvQEzxXq9bYnehvqtdm0HjS2bDmEwNVwpdMafCooonZLPCxhvkNk3na0qe5/7v4aGSdc/J5xAkGWytoaw9ko7+xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656810; c=relaxed/simple;
	bh=8lXGXxe7CmSHQS/TM+hU3YDjchOov6HnwAdnLL9Bv+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QbsmjA9Oh2UXtzh1zg7B7y96r0wSnJBL/fi8kRFn1ebFfUotWpCNZpAiMmnDibCQ8bnssTzy1UeEbS3mv1VVdprSZ0yJ38/3HK8HVn2kzx6BzM9yMTisnFWIL3PhNbkhEqtCd6mX9Xr+AzE/5nSO1Fwlj3gLg9n+zBD1X48QRlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSvh8N7d; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSvh8N7d"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44a044cb827so5049276f8f.0
        for <spacemit@lists.linux.dev>; Wed, 13 May 2026 00:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656805; x=1779261605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTREOXSgwxN5P0eOv/Eor7AYmmvvClB/UMV1LwJRNDE=;
        b=kSvh8N7dKWyFvw8bYRu0OKHrd7zhtK2DBiik4jflSoG7X9fTi2ST2rXZjErgzxe1+6
         gBY/J0B5EQbavlncU4Qofg17HW6JoOzMa+Cx3YjaaST4zRe16TQTWllL0MMHIPOp1Dpf
         yd5edb3DvsWga8te7U/cQgrq8RERN1Mg5Ww+8XysUe0f7scuyXu1HdztzYVvfmYY66oj
         CgiTkQu/o1RBMI/Fj3BXPN7tngFYJ+EjktiFFe7bcwyITjfVXX3GZb8ZU/Ev1XKHWRIJ
         Ed0E2ULRtstHj4xk1PfaIuOVNE3FUWpzTmCqeH5lpgFah/Tu6dI/E/ktsm1g6lsiqup+
         TYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656805; x=1779261605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MTREOXSgwxN5P0eOv/Eor7AYmmvvClB/UMV1LwJRNDE=;
        b=aezG5wEXYANkbItZX0jSW5tJx9/QDNIuq3cugRlg3NA669E6P8GX7753+N59Vg78g/
         txXNKA+y+wahjlw84BmoSfOk1gk1hdEzbmboaOoVpAszHPzuPbFAz9nwlZOOW2QX5WBW
         WPx+b7+jiEzEobghqcx3oqX/CYlHGn/YtlWfxcIhk8zdYKAbnRsLkNbimcOycTYpNQlj
         ekOS3QJQk5ad4yzdhepWgVRa1hJaZZ/KyNqVQzoMX49s9xHRSpNCL+GSylo5N5QDDJs1
         k5Ikr5hz5fdvhVDduBSlOGcQpcydBnfWWWjMp3IzM1kT+YYHZKsb6sjUOsL5ONCUoNgL
         tXbA==
X-Forwarded-Encrypted: i=1; AFNElJ/tlkvpx/u2ipODYtw+AFvrsLtTTnCv7X4SZlzXenoXBcbPEp/83bxZEtnsI5a1SAosL21PjGTXhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgpS6UigRNd9t6s8rb+R+UBXkc5eEuPu3ih2kHR9lfq2j23lTR
	vK/4/aIq16lWEqprzTcZ81PntrEKSblVfw3xohthfZ4vix6+0e9jASyH
X-Gm-Gg: Acq92OFOlbcPibynpTPHnyyVY70xzwu+6QFP1/kS85cuWuvvktDc+pLw3KFRxqQvv03
	h/IQDZkMz2LIrlAIWUigoEyhg8/AszzL5yLlBz4uI2BGlcNkPJC54dY7kyWBZVSKFwC4qVwSN//
	kDmRuHu1jn5t86P02/DjUFG614pkwdqSMzLH2396/1Vb4CnenJjXigxI0FAde3udKYCXtJnRm1B
	AbubGj+ShMfJYEkGmNhjV3qCZ9arnG+Ygt8n2VqyhkIPlGU6aYwORhh4Mc8qTB+q09sjots7SPx
	QM1gSrVp3Na6WQ0bNUBdTdc8PLEmophLGJfjJeTqDE0HfyE7HAH7IA4AdMFMOJPWjwxFDUdTGdQ
	It9vE3/W8FstGv3irPjykHXByksyCpnrEN9TUeHfYZTK2Pn35gaC/Y2hH8H0TRolPcvQjzTw365
	VXa5zGhJsIh29TBgocT3FgQEmG+IzpApnnREBTHGtPJLd39uZ3rkwezDiI9qhYLLVE5A==
X-Received: by 2002:a05:600c:4583:b0:489:1d23:4524 with SMTP id 5b1f17b1804b1-48fce9b30eemr18812985e9.5.1778656805095;
        Wed, 13 May 2026 00:20:05 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:04 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
Date: Wed, 13 May 2026 09:19:51 +0200
Message-ID: <20260513071958.29574-4-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the QSPI controller node and describe the attached SPI NOR flash
(Winbond W25Q64FWSSAQ).

Add a corresponding vendor flash partition layout.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 41d7d6d20a797..b0f66f49db4b7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -44,6 +44,15 @@ reg_vcc_4v0: regulator-vcc-4v0 {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	reg_qspi_vcc1v833: regulator-qspi-vcc1v833 {
+		compatible = "regulator-fixed";
+		regulator-name = "QSPI_VCC1833";
+		regulator-min-microvolt = <1833000>;
+		regulator-max-microvolt = <1833000>;
+		regulator-always-on;
+		vin-supply = <&buck4_3v3>;
+	};
 };
 
 &emmc {
@@ -239,6 +248,47 @@ dldo7 {
 	};
 };
 
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <26500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		vcc-supply = <&reg_qspi_vcc1v833>;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x10000>;
+			};
+			private@10000 {
+				reg = <0x10000 0x10000>;
+			};
+			fsbl@20000 {
+				reg = <0x20000 0x40000>;
+			};
+			env@60000 {
+				reg = <0x60000 0x10000>;
+			};
+			opensbi@70000 {
+				reg = <0x70000 0x30000>;
+			};
+			uboot@a0000 {
+				reg = <0xa0000 0x760000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	pinctrl-names = "default";
-- 
2.53.0

