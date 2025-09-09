Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813222D6E4E
	for <spacemit@lists.linux.dev>; Tue,  9 Sep 2025 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409347; cv=none; b=NlylIZ76HHr5SN6h27yBRN0igzDty/5241DrnxBCAbT94iXxTkDT5XRgGmlKjFEdSAGOMRFxf5064c2AG2+o94l/JHwb1yr6BVEv9rs6cFmOPeFxCGHHt78i8K4JWdJLoY8OnUjjsPDang7qdsop19/lEyUGFLzWUTnCsVwEkIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409347; c=relaxed/simple;
	bh=d9yyY3lRi0oWGFXJAFBO1adyvJFMOKukPKPljQ/13DM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMCjw9ogxGD7vjYwUXbITGJdgOmvLAkifjSxfLtLabR+L4yBmncczGFqPMf9nznvg3EL5Pg8P/E2NZoKBE6uxwnuIZH6UMM0Z2OLjRzdqWw2HCz23DupKhEMeVHp0547N1z5dCRVX7v/ZY854PejtGIy7E8hO1rtpMTOVq8L6vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HcTXd6wv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HcTXd6wv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3e249a4d605so4288258f8f.3
        for <spacemit@lists.linux.dev>; Tue, 09 Sep 2025 02:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409344; x=1758014144; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=;
        b=HcTXd6wvyIJ0jpfRVyjMlcY4Li5sG+4/LLSXDzvArS7QHLnHlJXdrJJDhI3dEaqvFg
         QV2nGJz5aOhXtWW7Du7p/MPwDt/G9mTkQIx34kAWWel8sh1pS3dwSaYokGfzZG2hRktu
         DQaYD31XdMtGpHj8KfQyEgA/fHkJ+oCd8m4vA9TOhcT8axbUh8UUEurDc4YassOewyvz
         urgcZTqdoI1aBlH4ufTx50mWwLf7LGvR7cvLKYIRAYd7ZyeiRGjqGBtvc0zm7UOwL5D+
         sxFvN6Na3Lyh5QNffCwLU8GoaNybf6AD7IcZ3uIm+H0tfyYkPRew3eIaKDZlhJi1Dq5Y
         A/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409344; x=1758014144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=;
        b=MXU7PqLkuBrHB4iwlplJTG7NZ3/4CX0k+QxiWVfOiMxu8Dk11HSdI1WvbeLQOzmCyX
         2iKYDFCHjxp/kBdsjn/Htty9yo/TniUWaCtHeeiJuQVN3VWy5G3ssedq2v2kheVHx9JT
         3brTtNOJjg6TmYrdp222Dl+KsXhQ9gxnIAiy43TKlbeEV3x0DvsN6R2SUvbRIdhUXwat
         U2Mok2Na/INaEN5sDZoq7LkfIEsx535eVCuSX0HcU1jgiOzaY0u9Zg9acXqE2fFGXS5g
         uZCy8yOQhGghsQy1tnB9FvIG7zVHPbPd9wNv/JeYNVcuyOfVT4VsppCI40GY6+Ra/zr1
         ui/A==
X-Forwarded-Encrypted: i=1; AJvYcCWWUsK/uLQJM1B5IurCONKXw0nzmFJlJcIxh2D+P3L/scRilx/uOcMawZmxMO9ZsI+9el+5CCpBpg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm8MZyhmB6/iBFuJ4zp44Xb9gQcQlFwV5Bbr2WW9ShhpiRpJka
	XbX+YTY5PlnScgl0z3NVYt+AW6LAVVIhuZ7XTNeIceWqwMKoqUIJMsJ63wRm1Pxr7Vw=
X-Gm-Gg: ASbGnctolbjtOr4vr45VhSCZKLc0LqpVTUwjCTDIA7D1wRUbJanc68W0kOqVheWBigt
	vMz/7ykI1A6JIvcIYD+2difNQwAKWnxSvtsPuD2wpdYRRqBCP3qx/MfnqOb7vhxOWZ/E/OFfwB3
	voeURkTRyYAEgxLttYxX5JWFuGSOTb+LlbWIVXf25j/mfDp9bz3zK8pGYJGSLREQs4CERBDrhtO
	meeaGcSdS84BkPbz1QdeejhjuKm5XVnK0UhGiDOAj4BfgUqVXDfzyKWXnh1SmmIjZiWjfeGi8UX
	cfp9W5UwELEGKTSwMshvunx3xXw1+pNmXcXOoXORYNqMKw8Pam87DQLKo5mGRXcPddrCW/+SA0y
	tcUdBDnAyUfNDZVwjIA==
X-Google-Smtp-Source: AGHT+IECDvyJ3MhP86HfNBVWgMSE9naIJTJZ0ycY5JDb9n5YXZLF4Z2JGvdK2tqbA8o20swd57M3IQ==
X-Received: by 2002:a05:6000:40c9:b0:3e4:bec8:dcd3 with SMTP id ffacd0b85a97d-3e64c1c2d59mr10736450f8f.42.1757409343760;
        Tue, 09 Sep 2025 02:15:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:28 +0200
Subject: [PATCH 01/15] gpio: loongson1: allow building the module with
 COMPILE_TEST enabled
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-1-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=739;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iZ4PlFFkHvr3VSD1LivXtszs5JdORDU8d2OKjqzKoYc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A2X122vy1cTHyhSgsG7MkIlsciNRM8ZFaAn
 T0KGuq7L2KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wNgAKCRARpy6gFHHX
 coJPD/sF2yokXt5SbcL4IYbnNJAAMtC0yciCVu9NMg4HOIEJbnJLMgoDU6f/Lye1GJHoJd/r8bg
 psxEzWVypKMAKXC2sb+CSVVktqi2LrWPd8WvjbD1w2ncKGKzuoVyrAB92tWBa1NfLh3OHEC0/ku
 wXBtt25qo0HmUF1tPPNUvjxgq2bP9TIbQyvUarSxnG1iQ43oZqiFep6k+G/aSkGV/eXl9TU97AV
 RiQxqO1JzL7fY/XVn+T589yE1pLjj+axt8MR7YyrZIyTlTCZzpRhxzrT5TOcFcBXyrdQuaK4G8S
 JvZcqp69ousBbMjF2RCkf6zj9stt/FPHhc+NIVzaO/+3Sa8+ozpD12cukCkwRGN1QLu8gIdG3B+
 7GobaI7NpSdG8YFEC2lE+CIWQTVJpeopaa/MVfsBLom8dXS1rNZSHXTXXExOTkQne5Y8oRI54bO
 dSblAGdXRavGi6h4oh3itiTfoSZ4M2+tv/WBS0fg0FbvwFAs4Zzw6lqS5iigmBx328VHt10DT4d
 p3OpeS4s1QtcpZmXPa9n3iQz4eK+u7bsgZALZlItLZr+caxJ/Q5lFLxgMJeqxzV4cHRROk2u17y
 qsz/m/yy5OZlZLgQ7uwBNunQYNBtvrqCQsCUhjR2JYSvEf0IrCHidjQP2VNeU9r0zEuIV4zBpsJ
 WMI3XWLHsq/gdow==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Increase build coverage by allowing the module to be built with
COMPILE_TEST=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 31f8bab4b09df1640c892f4d839860edaa2ad6a3..09cb144f076661e0a2069016175d0692257fb156 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -885,7 +885,7 @@ config GPIO_ZYNQMP_MODEPIN
 
 config GPIO_LOONGSON1
 	tristate "Loongson1 GPIO support"
-	depends on MACH_LOONGSON32
+	depends on MACH_LOONGSON32 || COMPILE_TEST
 	select GPIO_GENERIC
 	help
 	  Say Y or M here to support GPIO on Loongson1 SoCs.

-- 
2.48.1

