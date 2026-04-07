Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CBE3A6F18
	for <spacemit@lists.linux.dev>; Tue,  7 Apr 2026 08:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550376; cv=none; b=U4m/4JHFfPinrV0+WLqRJ4eeYMVf3Xy6iJf6Cun4EvSbdAYVVaKYK3iAuyfMyi2lWNlpDJKUn9BqJQhhHSbdwKLQm1G4AiRV8WoAw+eK5yhHQGX0CB07WJ3ELmp32k0AKJN305KcRrJDqQoyDJnPUdRwjigOxP15RJzL+iAzosQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550376; c=relaxed/simple;
	bh=KJIzry4A4nurV1BrjZIQd6f00tZQA/BJAngY3gGarwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VXDxI4UmUrwV9Wl0KeMHp30tiBLWLegsobqrmURmXQ3RZ3HRnP/PT8G/Ds5Mo6OH6/cNTF1ubUh4QgfWcJETJsfbUXwin7K1qX+QaZiXkK2RWn+1FmaTpfJRehQWOrKKq5XoqHElm7Zhg5dYZe2Jc19O+vBAX+U6HD+tI7RPov4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHqpQu/j; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHqpQu/j"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so4169614f8f.0
        for <spacemit@lists.linux.dev>; Tue, 07 Apr 2026 01:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550373; x=1776155173; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KR1DjVt7yf8BAFWkx8gfMXo+nWfoRdvH9vj0RlDPuXA=;
        b=LHqpQu/jyECRXWUT5dudohlOOMaR0Rr6gc5ujg4gVVM69nfv8l8ynN69O8L61n7+N3
         Oxm2qspWu++qF4LDrHY8m8dv9uysWeqzI28lGSzAHB0A0a+tzm7Jx+dS8YNdRNDFGVNd
         oqoRMfgdWKDLNWtP5wbtJGAJIvoW0jbO/gRxWeOBr+8BRR8m92wlEUvWNRSObEj5ih2c
         dS53nH9EVRx1sw3f52jDfgBrSv0IUW9aCO+Zm4aoYB+diV/yuwVxO5wl+0EO97SXw65n
         dYoD7DfUZGNQKaUMrFf6wpYUco19jdKaVqnPeiAqHQ2DWIARNfh4Y4C7PNT9mxTgrqFa
         DWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550373; x=1776155173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KR1DjVt7yf8BAFWkx8gfMXo+nWfoRdvH9vj0RlDPuXA=;
        b=csdBwqG/2yJ8FxMDFp/3CtmCvbVrHR0tmuDgXayzBkYHQ9pUeBj92Ijq12EmIXcG6X
         kfo40eLHecCE7vqD/bX1VnvCGcinguUoXYu9sgkYs5DfOx1i9cdqMCXh1fUmKhr9tDGK
         l7MdDhtRpS0B28T0QSKDTIaQ/2ibsnyaDT/OIb9WDZEI65AYdJrbluINnNGTOa1L/iFM
         IATZYeaXCezCrfc9KKgeREQ9d2zvdtIrl22w4cOJh8lwZdC5LaFnpW6GVL3Z7vWxkaEX
         p1KlTHNNmSEk6gVghT9V1rK4cN2xL+T/JUsyeuot4rGsVlWLrsRCYiWADRKVWHj+Zmop
         5W7g==
X-Forwarded-Encrypted: i=1; AJvYcCWfHMPuMxgSMzBZxa4HfXM8Cytd/o7Jafx7R/Nmyzue+UQE2JxahheQWnpmACj0vjZBKrREaOBMgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsGUqyVXEHqQR/+32HXU4vu/amHLfCD5qobqJxF05blJeSGYt+
	Zjrb30GcEtpnrNfKOTaxfnhXl0Kce0s2SBiKbqY7BpJDdsCWl2SbVs/e
X-Gm-Gg: AeBDietXsvm19WCFaon3PfqZ5p+YBBANOSdlX7c+TbdgqK9AHADODl124BbrFVI4kAX
	AKoQD31SdNlS4ZpA0DdIil5MKEEbojBNjBU8gkUSU5cYiQRwYuzwf10ei6n/gKE4WZV8H7Ff2w0
	g/3zz+1JWL1d3AY61ujoYpcb713FRIQXLcWU3ATNtlPSZHyyIyT4PMivKsRaWY6KVpckHak0MBC
	sizMnkZFy4zLVtMAp3w0fNYaVrmje2V+bwn+kwYaqi6VOSuo5jVX59vyRO9FTEYQTCXIs5Wtaq5
	tHM32lEwc+qyIxhBATrYK+gT3Svta3Dh02ln3ry6KtCodka7pyw9tQFXO97E9skevh/d/sIHVJs
	wgu1iagZUi8L1mZ5VU/zs3OcI1oJA4bk/W2ERQ0F7IrLGr3zSvlAoWJKxGGDNiU6QSLmqAM0eYY
	rdYbmQgMI8CycbRzBrxf1Ewq0kcdX5Ucgf5UdRYTRzfzkJeDLrYEQGWVUjYs6Pme3VfJaSe9o5F
	Ds=
X-Received: by 2002:a05:6000:18a9:b0:439:c2b6:d5d8 with SMTP id ffacd0b85a97d-43d292db1b2mr22596880f8f.36.1775550372704;
        Tue, 07 Apr 2026 01:26:12 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:12 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:27 +0200
Subject: [PATCH v6 7/9] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-orangepi-sd-card-uhs-v6-7-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 9c417a483f6bad6e60617cf8d5400ca079588726..95cfb4681ced8f539693717e718a3633c35989d5 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -140,3 +140,22 @@ aldo1: aldo1 {
 		};
 	};
 };
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

