Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B3F36B973
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 19:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333362; cv=none; b=fH8iiYPtWlXSnhJF8emRf9kI+NTgAwJCrRwUiuyz9yUZhZjr8KTjyg+NA7z/Lx6708L56ZaKP8C7DSyuTjupyEKQcrYUQZM3vCj0GoPDUWSofSRcDFzeagpFKYY67B1U4/gqaJBZ4OJdpvewxBjQooPl2NtSb7d8GHbcrPdm3pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333362; c=relaxed/simple;
	bh=ywZfSSvOtu1gmb3PxLYzxkGY1zcq4rrHofGqdsSxizM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jp/oxz0C1i/5exReuGADZ9xCZLT4mx2B+Mk2zpImV2PfNXH+GQI3xNXyelifUxN8r1x2X0GGw65wv/EcpausRqajaQgIaJx2elGtM2o/QJKavoetBgNT4qOPf8n1h9W7HqRPmd32rNBdpwX5YVoCXkAQ+vC8Ll6Mg4GoSVuhPos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=JAO9Ghba; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="JAO9Ghba"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-430cadec5deso22481365ab.1
        for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 12:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333359; x=1761938159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whAVJxDDZqUJMj7E4dlz8n3sScKT3peLB8arm+VC5HI=;
        b=JAO9GhbamaB5T6BTdhL8xncs7nenm7djH1cJ5YBiiafQQ3ciBpJfyHs25WaEig6V93
         NWtPDjfk5BlDhYS8wy4F9+SxnruXs6O6nV4ZRIJ3RkEnZ+FpbL31iBLm7DiZ00ECh/zr
         /e/RoGr0BFseCvCzeJFcxXMHwuwXa1iDIVTaPHC0Cbx3rop4kx3oBnVgWAYd1EBm0ooV
         q7jyJ6k6qei5wimVSUf+9K44oABYG25vVGhK//XJpjCwZRbSS+Z9vlUsx0SB0iA8hdDN
         jr9gVRytaYfqIPgiicnXvFvrxdkzpGQ2u+NFCbQtlLPqpYVRt75vbngy68a92gpq9bTB
         h6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333359; x=1761938159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whAVJxDDZqUJMj7E4dlz8n3sScKT3peLB8arm+VC5HI=;
        b=WDMH5TgbKJxhoTYKTGlcfiwkCJGzJK028+61OmYbbved1/wXrnLbX5XdQc9iKMbu1N
         Ub0MbH9r9b5UYtOw0W898TAz6r56Pnfsj1nEx238bOJVxviZ4H57VgUCpId5Dlpe3tKH
         jvW0fWOFovMDZ3v8yZfbx/GbgRAefgQNYz78fTSt04t6ak9xtjiFy9eCxSupAcpKhf2N
         yKFXVzwGuyjcMXz+TYoLeHJqPnFvtdafY+I2ocSOKLpfuM5BxHlFCae5TkRcMhQTgisi
         nyrQl4Ra9MIDAFy+MEXMAWd7lOc1WDcqfNB+3rz1VCOs4hF19lKDtcoVMPEF0nzzINwc
         IE1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfmjyvUuOc/Ew6euM0zY6LoNc5Ecl7D7TfAOnZMfGxMv0b330ohJHpsjlC9/oML0ygGUmA0+XjNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrtDEEhfrBqbIqxtBSEIxY0WkHfFbv8QgT1Rcagz5EZ6Lpezn0
	bWO3Ox9NUBVn4FgRjjrrsMTdxkmPiCGT24jpMnElL0mffH6PAan9gNXuGY8NESP7F0Y=
X-Gm-Gg: ASbGncs3xfPFzQ0xJVOYF3lTZjUqchTZZPzDHuy4OMfPXI54n0R8SQ5LlK4gM6G9YuL
	gQdnqOHJkpTfui82XLfpzg/DBPmlJ72sLVbTs4GHMgiOQS1Cc77dr7DlZQtrmKZXECeUIySBjVs
	qbuCvrDShnPe0fS1boKuuYJrs5XKfZnNLe+VnGrjp2a1Rt5ENTnbKXX3t8Qau33lP3BF+xcF7Cr
	Kwtxf0/01GPFkKpHk/Kt2JMJC8tsAi42821q4Gh6FJ0zkjhT5kxbnX9db0wi5ZQj8f3klw+vXzJ
	a/mEqoGACW4CuJGXzkhVQdEFTm+D6rX4jxCTQqRenDQ6ozsS6bWVl0/BgwiBcolVsUrY5IrOgGh
	7jp9bAn8OQzKTnwIAsHsdldqummHtptq9fC8QSSy1rQN6b01dAh59fxvYUxLioGWPP2t17Lc1J4
	eumebzRGnspm2aHYC/TspMPm9+zhVtI2RvbpZ6k5eQbFAmzihq7paR1A==
X-Google-Smtp-Source: AGHT+IHX2zRIoMsUD/QzZWZVb8zmLNqKBEZdZKIdnvVZGFa0ldz9lbQJW3juwmiEnXtXUSBt9XGehw==
X-Received: by 2002:a05:6e02:b2b:b0:430:bcef:e0a8 with SMTP id e9e14a558f8ab-430c529fb9amr413408425ab.28.1761333359510;
        Fri, 24 Oct 2025 12:15:59 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:15:59 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/9] spi: fsl-qspi: switch predicates to bool
Date: Fri, 24 Oct 2025 14:15:44 -0500
Message-ID: <20251024191550.194946-5-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change all the needs_*() functions so they are no longer inline, and return
bool rather than int.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/spi/spi-fsl-qspi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 1e27647dd2a09..1944e63169d36 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -276,34 +276,34 @@ struct fsl_qspi {
 	u32 memmap_phy;
 };
 
-static inline int needs_swap_endian(struct fsl_qspi *q)
+static bool needs_swap_endian(struct fsl_qspi *q)
 {
-	return q->devtype_data->quirks & QUADSPI_QUIRK_SWAP_ENDIAN;
+	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_SWAP_ENDIAN);
 }
 
-static inline int needs_4x_clock(struct fsl_qspi *q)
+static bool needs_4x_clock(struct fsl_qspi *q)
 {
-	return q->devtype_data->quirks & QUADSPI_QUIRK_4X_INT_CLK;
+	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_4X_INT_CLK);
 }
 
-static inline int needs_fill_txfifo(struct fsl_qspi *q)
+static bool needs_fill_txfifo(struct fsl_qspi *q)
 {
-	return q->devtype_data->quirks & QUADSPI_QUIRK_TKT253890;
+	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_TKT253890);
 }
 
-static inline int needs_wakeup_wait_mode(struct fsl_qspi *q)
+static bool needs_wakeup_wait_mode(struct fsl_qspi *q)
 {
-	return q->devtype_data->quirks & QUADSPI_QUIRK_TKT245618;
+	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_TKT245618);
 }
 
-static inline int needs_amba_base_offset(struct fsl_qspi *q)
+static bool needs_amba_base_offset(struct fsl_qspi *q)
 {
 	return !(q->devtype_data->quirks & QUADSPI_QUIRK_BASE_INTERNAL);
 }
 
-static inline int needs_tdh_setting(struct fsl_qspi *q)
+static bool needs_tdh_setting(struct fsl_qspi *q)
 {
-	return q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING;
+	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING);
 }
 
 /*
-- 
2.48.1

