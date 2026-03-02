Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C941041C2EA
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 15:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464453; cv=none; b=rZavZgpHQTaBAujtwQPBMDpwpJ51N1g3nWpUWF5YLa41fgcjLormTTJdDPRhvBzrI5aS17trMcOGuq89lIw/OSwCyMGaQOF7ROno8oD92xBT8AoIn54ia5x9cfJZ/V3Mv7y9T2pzE8KIwDM41ebFsDhas01a0AQxjcmLwFZXg1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464453; c=relaxed/simple;
	bh=q1S365EAUCSFZRfzHFj2YrxqxW/P8gDiboVdNm2IwmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DFbwuiNA+pi6zELOUEr213xsoC6aGBL98l6rR1uiqr1clHFEa0Veboew53Ifs0dvcRfEbDCxp2j9e3DQq9r1Zcv2Gs8Z6J+uiDEyMVgpPRO58PQNB3GNY2FwISJ/Nat1Lm/D4GdgL5NlT8d5whw2nQWz0J98AS5D7FyOY43Mshs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQyc6hY/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQyc6hY/"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso39620035e9.0
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 07:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464447; x=1773069247; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxmhxlsdpHuelB78+3YE0t0LkGzrS5SfPUfh1V6r7eI=;
        b=VQyc6hY/nCVe+aNJVW2ctSi5t1IPLyGfles/7aiyXRa4akffa9RRSs1e50j/lIjw8a
         /kglychBBhlmMSmZ6Zkp7V0GZwZIltss3cU3lxxh1iTebXN4+cHZYrw8u3JOebZXMr53
         8oOB9J8rX5qJOjv+A7qEwFewJd2tecnAzlE4rbb/lVGfkKQjkfiHKBJVNfsa0cdZ7yLa
         T2atOHC8qp2amg5HNM+Ub3gZeNZFeYod8CHWK0Kfc8ug+IMuMjRW2LMUruFpdpW2toRB
         dDDY7Q8ytPjkZLsZhlBaRjEa/8cE4ryxM7J+orF4BCQ/5+WdoJrPHguNhqidp7kiPVVm
         7nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464447; x=1773069247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pxmhxlsdpHuelB78+3YE0t0LkGzrS5SfPUfh1V6r7eI=;
        b=rilvCjYT7l+3clo4aKA+BouF5KFTiOCEEklTsXtowEMCR2PrxjBckPnbYtjtgSY5yZ
         dH/VE2df4tSJB3cAsPBzlLgrVr+KHZ5mFF47eWsxOqkwBVNMfVZ4fzcD63IVeNnuLR68
         D6x+NnanybU3a/ZL+eW3vWTRKe7SLWaxkvwzzFE0w7rVCG5BcJ0tofgd50l8Doj5m7Jn
         vthRfFFr078Wv9z60lmSYMNwTt2Fe9Wg4yrmTeBI3K9JUu1jGvl85D8GBz5PxyK2hMSX
         6E0pZKBVPODd+Or/eoSqR4JrU+/Zg8cmnGy6DtoMf4+YxcCrb5x8eiQTeUTsc2klX7wm
         9FkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvnbsjfNQ8GVKxLI9rgzdxoy6nZcFuEkjAzEOtPv/V3s6z1mvvXum2GPDOCQXnqCQrQjwfbucMrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNbsFy8v9nEkZaYVbaFxYyLDdbKgBBIYdfIrazau4tSUzh6065
	2ZQl3/L/iCD93rmFnyZAMkz2QK660uOGdRQhC6pHCYtnDVFfLX7JeuM9
X-Gm-Gg: ATEYQzxM+u/PloLLyRuEEMI8FvW4bR/lma4IHlDXV5miicF1MAT7h02rdfg2q7l5cEz
	E70njThGXAc518BkaB0uN5zaCyQMFvaXeWrdTnC7n1aBfdRCwpnuerfvV2KwJpxEGqX2aai1G60
	6PzVyKJonL1rINq7OzVjdtzXaIiXKsvwWOV5yqFtej8vOSKulda3jk9UqVQlSQ/NDVrP0IjfChk
	QDkwMfX3NUn9GgugQF2M5SBNIlCA2qnakv+6wlqgagVPiTDtypQR6p51Um/CQoRNbM9+AgE2KIU
	DOA4eAw6ikkHR7/H+F5Kdgg+nKJJsPNpUD3aSNa9jt7fWbhLARB2LxEkJ0CtcKZD6iQud358CN+
	L5IdKHLeRXRuprak3G5+1+/7Ms2uUwy2KUcVtY4yOOlCUMiuXks71oiAqYWcB3taM6sndfJywcm
	OKlJoZ240TI9VJBDg5scc9IAw3GomxDPVJdivFEfc6mrWHe71ZuSof2YBjc4164IJhuA==
X-Received: by 2002:a05:600c:4fc8:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-483c9beaca0mr263703895e9.19.1772464446760;
        Mon, 02 Mar 2026 07:14:06 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:14:06 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:31 +0100
Subject: [PATCH 10/10] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-orangepi-sd-card-uhs-v1-10-89c219973c0c@gmail.com>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Add AIB register properties for hardware voltage switching
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 414b03f5e6480f05f5d7eeaaa0afb4e86425ae36..f22f7427b3370a6b6c1cd8360b33efc2a285f8d0 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -140,3 +140,24 @@ sd_vqmmc: aldo1 {
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
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&sd_vmmc>;
+	vqmmc-supply = <&sd_vqmmc>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	spacemit,aib-mmc1-io-reg = <0xD401E81C>;
+	spacemit,apbc-asfar-reg = <0xD4015050>;
+	spacemit,apbc-assar-reg = <0xD4015054>;
+	status = "okay";
+};

-- 
2.53.0

