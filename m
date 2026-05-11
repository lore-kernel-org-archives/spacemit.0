Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C788836C0CA
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497890; cv=none; b=r6GU0OYi2/VLMEQj5XHGqyGT7rtdGtyTishGdm0tD7wFBu5AGP9fqdpDDyQ5qmYp5lHz3EfGiq+6jDurRB7dtBzxjrDzh7R5PNR9TX9p/2saGTCSTjOKVqzMtfdmxATO/TpvQPbDUfAsLvA/abEQkhDHK9j+DiKygwI59iPHpik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497890; c=relaxed/simple;
	bh=yAZziDQoNfZz+a9I9ktnZW0m54pQi+joUOUK/8VVPDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iScym+PFYX3A8kle5S36ieNNMpa5Q3+yn1uqUCOwH0xEIMX8SaHHvNzoNv0fR1Dl0tIXHZ2iwkgQpcz/nPnVwOehxA+Ync3IFGSx4QX7IziePU5V86cNUv1uUh4Z82+iF+3kFzT2CrHjO1u6Aa2bISbCcqvjYBp12aAjshfczOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgmgCB/N; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgmgCB/N"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso38116275e9.3
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 04:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497886; x=1779102686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=879kJdymdXBFu58jnCcAvuFoRWhDTaO96RlJIip9kww=;
        b=EgmgCB/NzJ1njxTrjuh6jNz0LiR4+Bl97CaVygpw6502MO2kuVixyAFR3C4tPcKld7
         G9SyVH1eXEsaKSFgK9gZ8jyQn3MfTmAIofYwChdCpkY65FasCVLOFmP+h7gk+KmQJb21
         H60UrNaUELgJ2h53bhJDbk8XMMwXjpV2K4YAzxrJpF8TX2FpKJzuw4b9FM5nSZ5KzCs+
         4IzrgIwOpggG2PuMWv6K04nq7nkxiTT3RcIz8qn/Khm9KO49uX1Wvdj+rMi/uQ+vQZ7A
         q/asOwgqJmHvUIgG/IpOYgP7Tf6kCx1lTRCPc/Jv53kJt/Ofa/GrVBCJIZFguhTtmZtd
         jcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497886; x=1779102686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=879kJdymdXBFu58jnCcAvuFoRWhDTaO96RlJIip9kww=;
        b=jqfKqMmz4x+VaWf+dk/8RprJ8wj6F9gT0Gzu+a4EqYml9MMMhH2vkQ4g5zUzMmriUR
         tmhT42Eno/d8NXblsMXVHorPQQ9b6X5937dJKNN2r8udXuagZN5KC3b2JaRXvl7SF1sT
         ukzE3ErU5Rf3NueEnt9hx2zgxym7d3Q3Xx+skCEDQwVX6bbHJbH/IxRBF1GbB6ZONUJT
         kySlEdkZG6TFIT/lllli3RvOWXXh2P/IJ17tsWwHgL4xKDMrwfQY5twvuj8yy4xebBN+
         h/tcYttnzU3TsqdaJcro6ugT1m92Nmaw3s0FRhsmZtu3bqAcZinVEz0ua97+w7zG8IZj
         xdjA==
X-Forwarded-Encrypted: i=1; AFNElJ/eOLRMiz4Tvdxd4f4w7+1XE8nGedYiP+9jML7vhDsLfEUMYXXGNIQRXDGXpWDvD0z+pK7nDTgVeA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLItEsOrxon5iVClJaHDhtOaZEww0g9UjLJW2FLkWUQ30JKcQ4
	MGu6HznO9mfMsFMJ1F9zNwUh591PFEvZmXLFBSae87G5EEVunoSVJX5y
X-Gm-Gg: Acq92OE0xWnPBFCKPUXGzERTUoFqC/G12sZ1/8xuLtI71Jfz/VcSLGVYyEHjFkoEXHa
	ir1pH5+8SW5TCjc5O4XnqyqBr6kSDYio4CGbOQeVvMO+nefc0Tfsv1Wk6/tLWRH5fm+sZQiJ/t8
	3QHXiyT6hQQz4j15lfV9wFR5EpggodMcW1R/TVpS8wIdAop6e53PQPd676a+R0PrCl53ZaS4NX+
	+ooKa8tsb+q4GNV8T82p78FGoyhEq2uxbOt8ppZ0VCv/Uq0jT9XZtdqV/TbcdR3cQML2vo/918U
	QcKIrv9jPGfPo/Y1cYvntjCgutUrgpgJ+2R0acY3Dsf0V0maM17Geh0e/6fBuO7yRWpjaHW5oQK
	8DhqATUb9qiRCrGlZ1t1lwrxJ8Yt5Kr1nXcxbegf9TB5FMD6469lxfxDxfrFbbG9HVV4R2dh5un
	KjMPwMt6CqMLZ33epmZ7Ut3/JI+blKhYJhvzqExN+QzGKxZPBl3yCP31JxTZJu76STrnTvyX4fZ
	okL
X-Received: by 2002:a05:600c:17d4:b0:488:c014:34da with SMTP id 5b1f17b1804b1-48e51f4cde9mr227432505e9.26.1778497886135;
        Mon, 11 May 2026 04:11:26 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:25 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
Date: Mon, 11 May 2026 13:11:12 +0200
Message-ID: <20260511111116.1109643-6-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the two PCIe controller along with and their associated PHYs. They
are routed to the M.2 M-key connector and to the PCIe slot.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 9c90c2817ecb7..2d3e30f0bd806 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -36,6 +36,24 @@ led1 {
 		};
 	};
 
+	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+	};
+
+	mpcie_vcc_3v3: regulator-mpcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "MPCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+	};
+
 	reg_usb_vbus: regulator-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USBVBUS";
@@ -275,6 +293,38 @@ dldo7 {
 	};
 };
 
+&pcie1_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_3_cfg>;
+	status = "okay";
+};
+
+&pcie1_port {
+	phys = <&pcie1_phy>;
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+};
+
+&pcie1 {
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+	status = "okay";
+};
+
+&pcie2_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_4_cfg>;
+	status = "okay";
+};
+
+&pcie2_port {
+	phys = <&pcie2_phy>;
+	vpcie3v3-supply = <&mpcie_vcc_3v3>;
+};
+
+&pcie2 {
+	vpcie3v3-supply = <&mpcie_vcc_3v3>;
+	status = "okay";
+};
+
 &qspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&qspi_cfg>;
-- 
2.53.0

