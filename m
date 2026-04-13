Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AD63A6EF9
	for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 08:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067372; cv=none; b=fQx+TYgeTaTsRop0FENdK9v9r7smEP5oLqPrvavns9cOIms0XVnusC+zulcUuILomNF9eBMr01ByPUhVhNU4Kj5qDSuiugpBUpFlNUL0UtLBERGxe8pltL4YVlPm98HNbTj/O9fqWkmcr+XGPsohE1EJqxqz/+VM4StsDm7h3O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067372; c=relaxed/simple;
	bh=1HbIW6/OtwG0nzFhm8AN7DBXkGaNxAyxn8jiZchQifc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXW95GPGIe6J0DEaen701atUDimaeRATeaSQ0vzK5C4uC0ae7NH5FvDabotWe8DZrFclYevQaUfw64XFeiwd/XORb5kzb/PQlFoxBD3rLmebyJMByBiaXmG6FmDL6sYk1Sgt/mhMfVazbJ7ZQ3YXSd9BLj5DPWqIAIB/o09hdeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1WV5QKC; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1WV5QKC"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b980b35534eso566000366b.1
        for <spacemit@lists.linux.dev>; Mon, 13 Apr 2026 01:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067369; x=1776672169; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgUUdQtr/fVKD3Ff4J9UbF4I4wxaToLEFfaMYOrzMgY=;
        b=Q1WV5QKCiPC0pnws8W27UtOtt8fQZhjX1cZ7cgFkyVSKukoaGui90TwS+7ttG4R745
         Er3rxXbPXe6h5Yl9uR951eILcC4Zv6zmCOBbn7Qt9uJh2YOA5KSWvj37I9S0I/2SK1SR
         k4ve9nVeUAE70T6TgiGNQTeiXAwxBCUV0K5+KvBJ++FQ8nDinMqMBTUMWemCsjU99q39
         0eUmo/mzLl+zLr/vNw63mR7ufp6yys08iflT+GYwq/ReC+1ZWsqN0myz8DxWgjWHq7xO
         kgyLc2mTbjctPuaS8U0Knn+gl2EAQyJqT+zj17CnMkmbwZH5YeXXphxd270ruVfZaNtl
         Sy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067369; x=1776672169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jgUUdQtr/fVKD3Ff4J9UbF4I4wxaToLEFfaMYOrzMgY=;
        b=l1D42LDkMn+lLfwvNFAqfvBal6QkLyOB8wkxmBS+yPhJ+SyPBpfcbrrNOmGb5/lHHr
         KOxxQybRfJfrGBRKluO7Xv2PgqaL+F6SkpnCO59oN+qaq6WY1kwl47pUXnr04aqvMO5B
         9Ep+qvlXS3r5xGDg6fmzBaZ83k6a2ys5JiJOeyoHMQh0DTH/++oAqjcJQYtHUhnyiVBI
         ERY6vVoEgAdBiwyniFHG/1bFGq/3rdIA0guURDSkC8v0xSm2CVCO+484e8fTG9RfkHLk
         6qbqn+eFZ+H+jZXQpIDcyugTIkcfsopPI+U7tT1T6yf2LLJyuwHgA7IXlMvYeBxkF0p/
         6N8w==
X-Forwarded-Encrypted: i=1; AJvYcCUkOfSqwTpiX5neJrjWsf0+XFsNRWJxbmoyNLgPkKL7tWleOKzRoniQ+cYDjMteROF3lJJBH+aSpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyI8a/ydQybcv6HpPf5DdfD4jcRmEnwqmlQCt6ar6V4ulIanzQW
	fqxSaovw/YnxFTgWMgUzubmigGQaijlf3ylN05KgdT8IW3Cu/y+TZLjH
X-Gm-Gg: AeBDievbOT/1X7uno1ic9G6yNfbwziXcH1+YwvQoFT93zf9IXvWk9FIMOASuVGDQLn/
	/SPWehXipBjue81TV4oBsFYJkw/GJO3zLuZgVl5lLAV4Uh1Dgq7qnKLsfUjWfoFpa3naal23vdO
	4yzJZzdhf8r3fyyOOzzKCx2hqK9vnnQxmNda4zAq3fvgALUxMm9Zl55fk+QdciNdah8KlwjSlBw
	Hi2yQF5x0ribBzIJcVxUu2+dJs1kzigQOcllXVnRg8rYXmMDgfn93etoxJDVGNVKE9fV8QbyvC3
	KPL6PJM5lBqKAFWcl9+iaQcvFM5XCuqcau5BydJoI5iUKjDbaDbyJxmasv+kX932c0YbUQ1K+JF
	KB9/RLnF+Kv7aqfQ7aqzAJ4l4xfzSv+bbv/dKcqsvdLflJhCbJ6EQFU4UBWNxBJNn0NuGPIkc0J
	Gh47WsSm7iq3dWYNvu2dPAw48xm5Kb4Cl0fhBB5Clr+F9WIempuUBEFH+OptWDo2hjGLnCxeCos
	Gs=
X-Received: by 2002:a17:907:60cf:b0:b98:8494:3174 with SMTP id a640c23a62f3a-b9d46265d98mr798014566b.24.1776067368357;
        Mon, 13 Apr 2026 01:02:48 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:47 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:16 +0200
Subject: [PATCH v8 7/9] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-orangepi-sd-card-uhs-v8-7-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
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
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-Mailer: b4 0.14.3

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
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 9c417a483f6b..95cfb4681ced 100644
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

