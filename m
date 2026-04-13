Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2773932C0
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 07:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065224; cv=none; b=Id3YjKIg1nWaZ1Q2BJltNjCIhKI6Om2E093LpOiATjpwjMxRyK2meyu79/9xzqtthN1AdSDQqQVvTe91ZZ4M9IbfdTL3bZwygVlfC1zuvzjd1wklTNuej3OfwJARfeWZjnpG/DGB9ZUucWBnxbauxV2nn8/NPAl4pjBwAfa4rw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065224; c=relaxed/simple;
	bh=hxs3OSpNzHQmcxvHvXpddESvsaNDoOgB9L1Rmxo+7a4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IqSXDXOyMbrKRtTegwteewFyk3YshHnfCPyfe1MHiY8p+RQJCHq14xlp7uabbuZR4CpYI0PI7rZJagspg5vXfAuxM9Aac6gzRVdzPsYixLsPuc2mbb5oX1UWIf1a7mn97wM1I5nKOkE0MGDd668/WDSjRLRbUPh5wCjw4ktbVgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMwNSbZm; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMwNSbZm"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d77f6092eso444008f8f.2
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 00:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065221; x=1776670021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPuO322us0uZuJ4hizKSGfFjcUXHsAzG0IoitERG8vY=;
        b=lMwNSbZmGzdIqDTWyRLRCBYR3cK8jyEyAAQvaLmqk24CcO2+KmUgjWocTj8ODv5nLu
         WPdb6naHpemVeajVn+tb9EBzFoFBbws/Aq+0CEzRF4iHjLjxIr0NC9QiLeVWXhMnO4GW
         QDPeoiil3fbOZU9O5zaFl5Ybuw79JKBVCyB3phC6a4FdXLGgI9BADFssm70X0jbny+nE
         X348Mtt4aVwARZ+vcK2sfS7vxbOgq5Bxg6WSAcUOZfJmkhKMO1rDo4WdcUHkg/qNh5nR
         dH2fZlYkr/cv8OJrXRHmuvvlg6hvGCnmYV5tKRfSZyPzY5qo0HYK3ZFdrfP+lQtO5n+s
         eBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065221; x=1776670021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rPuO322us0uZuJ4hizKSGfFjcUXHsAzG0IoitERG8vY=;
        b=BDqAmaS2ESAwIgLJIMChYgT+83CK07ZvlQlU+uf900qkRNvAAxiwyiusOrMAjs+5+K
         t8+kCcVWlyvqC0f4xQWmO+1lW68lpJ5MKBTLBOnYAGb2u1qaaWyGDEBO9bbi6I7rOg3J
         NhGZJoxDzB8QoKoUGtVFHHdOPODqSltnE2lI2PpyPMnz3iU88NjRWSM9soXwlfAjYQsy
         viUgMlMZeFQAR1jhVLJaBRKqomaGQBFQOXWjWPozsnjBcWyoYsAsaFF8IVpbkaazUxGE
         8UazbMDWq8tpXbPsVnZOYKHZkj9yd+9nIHExBIsc2Dl/i896IsUWKXOqaUsc1U5uKoEQ
         PfhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TruQFFwYjhT23RT7SvhJ8TI5zGO68AnA407TYy8I7S7KAuRsuvXFCahMM6T+/kd3urph6kTEaYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVIhT/u+IUDZeePCOecWK1EIGDFVgh7Lj6KCS8UlVh0jDoA9zT
	+YGDGN3b7X1SyYDuu6PAG9ZopN/NlF2ZUv/hI1fPQJi1EwiV32mJgUJK
X-Gm-Gg: AeBDieuti5skUaC2TtB8LMfqyz49a/rZmUSEZ7uTJ+9pgkuJ4rxtyHgzIin0be9vo4v
	anh4y86absw9ceWrXaaHNEtcqKuCuRvdjXTeTLiTMwB3S7DQ8XC50MUi1CGO0Oxt5QYanSc2c3i
	kWUv4HJpSOesRqRTFM+/xEo3Jvz28JfpScte2r8dyiq2tblJwz6nyTHDCK/LhLRpaliE93h8/RI
	UvwatDNs0uAnNcj4f09Lcl/y4iFnAL3wEaQUZdxmculpaED1N52KkTipqRKKoxibH21I/Gvcnaq
	57pRVeMywJXmV/uBSt3iwP6UxI2iBLfZCRy/eTr5A5MCU0gBfh8RUFPTN1Ehk+3rpqWiBMkhdMF
	R8Da+b590ikgBZgV6fI534e5OzuY0KQgKRB3QoRmcOLYJsbG/pgHIgjPHi+AwR0+jc0PX1OsvTt
	4/oaPaeg0f22MWo9BOoNQz9Hwg3U3LrL6xHQnvfiz9Pgm1sZ3/Ux57ufB/kWe3VUb7
X-Received: by 2002:a05:6000:3109:b0:43d:1c21:eb14 with SMTP id ffacd0b85a97d-43d6429bcbbmr18388161f8f.21.1776065221249;
        Mon, 13 Apr 2026 00:27:01 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73b44b3esm13045692f8f.13.2026.04.13.00.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:27:00 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH v7 9/9] riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes
Date: Mon, 13 Apr 2026 09:24:51 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-9-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <tgamblin@baylibre.com>

Update the Muse Pi Pro devicetree with SD card support to match what
was done for the OrangePi RV2 in [1]. More precisely:

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

[1] https://lore.kernel.org/linux-riscv/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com/T/#

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 66 ++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 29e333b670cf..774a4640f065 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -18,6 +18,24 @@ aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
 	};
+	reg_dc_in: dc-in-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 
 	chosen {
 		stdout-path = "serial0";
@@ -77,3 +95,51 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
+
+		regulators {
+			buck4: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0

