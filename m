Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E32838C42C
	for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 10:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261182; cv=none; b=DoiaAbryiTHjUaSE04EGh0B4HnOuO3Z/XZaZ6Y2BfE3D95SiiuIYyx6AIK4RDSd69ovy34iEYLmn3CXgJbTka6naobZNdFZM/8U5cfWcSlN5pf/YtQNPjPh06dLWl6MsswwGWysV6xmHbsgBuaYMN8YD6kM8RtcKxKDnn0au88I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261182; c=relaxed/simple;
	bh=0EFZ53q2XAEQCbsr9UzobauZinI9NCe/+PQ0fxu05PM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h0syEO2c6dcoPNsRolyOnpwLc/g+AfZqlN4sn3jz8WjOIxRFWwoBOSfD87vyjxXPnr5WlcXq11N3meEtViZ8T2vBlubv/jQqVZZklWBzcDD4O5A89MMzp+6RsjRhxEmI3kq3pN3QYIBKhKm7i2USiv2vY+eMUoyRBK0FLwjDBrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZgcbGnC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZgcbGnC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so23568735e9.1
        for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 03:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261179; x=1774865979; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LbwR62Ox4pP35TzcC1/kMlb8rYdhZytDukagY2Rkq4=;
        b=YZgcbGnCVguS6Nym1VwqX87b9VfWyXncpvBBb81ak8M53Fldl+4zIe0OiXkDhscD3G
         KSiQkv7BKWPowleeGBwUoTx+PsIDfUiPIBnw2zesMu7uWlNIsU4dEXliol5Iip1BeuHX
         qtoXjG1qbWp1uuBUZ1+MGgnhTaQILdiUynYdcGSTmd3nnUNzLjQP5siGoQVULfuslLEr
         kPzyOSyQ2++795mot9Zs6XjeeHvP3wNJd3mmWWdfg8lAJC4gwl3mtMuppX2BiLUBTQmZ
         icKyd7xTIF+Vd5P+O22ax6stSD6mg6VfmbpztJkwSDClYJtjUKK/6zl8dSvJ79OnTdri
         M3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261179; x=1774865979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1LbwR62Ox4pP35TzcC1/kMlb8rYdhZytDukagY2Rkq4=;
        b=guwgMXn1U/sySOehN01JqheFYUFVfreFlGasZyJOvKvOueu2lHvaBP03jehu6BiKy1
         3mbNaJTCoS2UsQhvK4UxEtg/x/KSwdaDPmuKRMvvHGNI95DKrjsYgmpHUgLohlMdr3zl
         wynvJS5QSNC9cuA3toZ2XLQcUBRBF3wz9dsFp7lyoi6YXmZz0ncHciVN9s7vrx0GS6hn
         a46cNtZpbCc2cS4WlSkBedczRAF6zS+a5rV0OBpfjgY40qZvUAufax3OPBPFemCbQrgg
         IkIGtmG3dGNmh8tApZ3x6jvHiL4fEYDe7IKv3ZaPNgAUUjC9xBQO3q/X/gwAfJAHoM1g
         QHZg==
X-Forwarded-Encrypted: i=1; AJvYcCXfpBXPBPj1VB/kLLJ0Fg13P4ny8PZ+jiF/9wnNUB+28c80VYJXvVwl/W0nyJ+3/Kas7Gf+fsfPww==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa8KsYosnBv3cZ7lZpBr5zfK8lZ4eLbNbJ9s856VkPaG02XU+g
	7vEZG/d28vLVDzJmucI8GDr+zeBZ+cxM0Jqtffhs0Va/PFwDFb2PhDqG
X-Gm-Gg: ATEYQzwvaFV312eAyNED/6+oow4C2FdUuL5WQG7SzClqm/uK62I2O2XyUD1fIuSxupA
	M1KPPLdFRkERnpABqpbVFB9zFu7Hdirbpen7oBzQOnjpNGbqKfplN3SFR8pg4mzGUDvfwzngr5U
	KNsRR18df9u9vGR4RomFTd+Ub/y7Kkkfq5tvYtg2AMaOJhbBVdGGXsVPbaf1FAqZN/oMN2zVJle
	7SlQ6pLHuCVHar2wON4v1eh0Sj7DCcuLMuR9YYj1/2tJIfWR+DQ3lKkyA1MnH5dVOJG0VFChJ7/
	00docNbwABIlr6HD0PW5465V2xYNqSaTV9SOp5AF+idvwdyxd8Po7XDN2i+IezCOaSc8UiQz9SF
	ICXjC7rhhWwfq/oh5kwpI9TsmmtU0CSWK1f1ertNf0Y4s+IDUrDv5UWW1V0+u5EhbIoaxjYx6B3
	VvcrrFzxLzx4oyvD95jBeN57OQ1BsmwKUnm6ss6H26Nw+0bKyOIRN9vZWh4iBM+xty2iqhOdb0V
	xQ=
X-Received: by 2002:a05:600c:3b07:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-486febb59acmr153371395e9.5.1774261179356;
        Mon, 23 Mar 2026 03:19:39 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:39 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:09 +0100
Subject: [PATCH v4 6/8] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-orangepi-sd-card-uhs-v4-6-567c9775fd0e@gmail.com>
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
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
index 9c417a483f6bad6e60617cf8d5400ca079588726..5f823611c969eb0e15546862228ae4f65375675a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -140,3 +140,22 @@ aldo1: aldo1 {
 		};
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "state_uhs";
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

