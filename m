Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985C736C23E
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 19:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333366; cv=none; b=MexK9LdZDiXXzjbkml/74U9UI+uomOB6fIYURybfa8ykT9zFz30RtWzVzElZZ5SsBwBBGWKcOmDMEtfATCVQhHYqN1WNJG9othjWZVBDR0NQXJ31QKxwD6fQikF8r6f3u72JLw3XwPG0RuvCWzOwkWmFisgjDkrp8z8hEaS67vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333366; c=relaxed/simple;
	bh=k6atjC1oTdr7ZwQ+JAP+shvhvXbx3KJya4cA+9vZLWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RF7hUQ7SU3SSZxCTVaJCbzyo6KgTfKW3M6I81PmYMgyN3wUdK/di1JLcz+b6GPih84m/aIpllVp6HWkHpYECW+Qt0lK7tM3ucQHxr6NF0maEnUUFNgTNICIxS3Yqbk9F4JNbGHipuo40IYddvpWsRNPoSHcKijqrG6/mtVml/fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=wBbo7RR0; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="wBbo7RR0"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-430ccd45f19so25240125ab.1
        for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 12:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333362; x=1761938162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9XwB4LXCLiaym4oip8K88EQHxoBTQxTfCvmH5+Ipi8=;
        b=wBbo7RR0LGz8UT2mXM9g828JmqBcspuy2PjFgayeNBBltKdhfrxlh0a8mWuRzjg3Vg
         0xaMU2br48O6wtKMwqHglKQ87CHg5j+h1FXm2ryPEUF/it1Pb6be00G2NqZh5KjAmo8r
         or2/LgQ9+b5ouemHZgFemp1gMRpgkcyA6HcWy7h4uZGvE+e6XP4Ikac+Y4a4iiWRMJ+B
         kJgiPHca+RXUYUj/YAVJ9vv7fcMjF3tB3qd6PyGvBQXvKqrZr3tVTNnIWg9atPub24Tz
         EHxoxdefy6G8gfCc7aRoA+w5rhcGLkKTrr9erb2pUXagEZbe43Nygs2NeMOiv38RK/Uw
         PW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333362; x=1761938162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9XwB4LXCLiaym4oip8K88EQHxoBTQxTfCvmH5+Ipi8=;
        b=EdJ/YrlB0VlxVEaligAoOKj2UO59x2rOhbge63PEZF01dlrK6osZhXtJNRASdO/mfU
         hQd5H7ttV0SW0c04pVHPd/3kow/JMIRfAQqNb29oDqQiVO6uagPUVX1fRRoyi1TxGLnv
         u0TZklXfm+a/vhy3ZJB8cNSfAHOYEAW2Kjy4dx1/vYcla5d4n5hpvjfqbnP3jgxXGblm
         R0BVvLKZN6D+ATaKClQac82aGtcgTD7f5r6ie24eHEaKiBfq/Mj3jU2Nv4QtDMECjKss
         w113+p8DFRp5LLkhcCct/FjoCVACztUuiNXBOpKbIERYJoWcwMIQHhsI/HArkr9dOssv
         cNNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOtcgXYo7DfzonCKNmx+LT6An99MufTpX3sBlgfFQ060OQ/R5weGyIFd2lYsrV0qwM7gL/waLp1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgRw+I/K7d6HEcXv1DQkYEfLGbxpWUbQRSTDvXCt9n8VEQTPw8
	QNfKsxocXCKJkt1XKEB5fMGLX3MeX1+exhgj+dq/FmCZv/mY7sOjrNe3myaE3Mt0RMI=
X-Gm-Gg: ASbGnctdGjBxMJKsVLG4SmSrT7QiaqJ5EXtLnfLlzdy74j6T2Cd/JEwE8hTskj+niN2
	FwNeXgYvyKfwKHibLMQzmZkwRR7LqEsD/vGFR69TFIgtA5rSh3ZO2sG9DVkrIG8NGiA6ihss5kd
	EvXiXKizGoBrS2cttgo1Qrd5ZN+Xs2eON0k8UbK/wmPdu4k3nCn1uYAoX590sSwXHgfwwzl5mgt
	cEbJXJcuigK1NRFAchDY+PKwOh6aeZaBzvnWzvBWkTTmFxgVKLR5XXvjVFLnmZSzX1MCbJxH8m8
	G4xV2S/PFXKCB7m/b/z9cJHcSbRKiU2WoTyIKZfi8hqoaquo7IGajGg68LFqEQoIkLOHhmYP3n7
	GIqI3nbfzTHfwDjckmO5113C8aZQQyEjmErgw4x3xM/0DBtKPRj7tIlOFyJPGUGF4ROOqg77EkN
	Q2MKpCCBORAigKwdw99yGATGMH5h+QDo9eTAxK47GiQXk=
X-Google-Smtp-Source: AGHT+IGDjCZrbwlwcYCrEqEaKTTyt1rgAZl540PN69Agvv1E5bOXHHhIHceJWXZ0grnxWP0ubmH72w==
X-Received: by 2002:a05:6e02:3712:b0:430:ccc7:68f1 with SMTP id e9e14a558f8ab-431ebf6dc57mr41093245ab.28.1761333361639;
        Fri, 24 Oct 2025 12:16:01 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:16:01 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 6/9] spi: fsl-qspi: introduce sfa_size devtype data
Date: Fri, 24 Oct 2025 14:15:46 -0500
Message-ID: <20251024191550.194946-7-elder@riscstar.com>
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

In fsl_qspi_default_setup(), four registers define the size of blocks of
data to written to each of four chips that comprise SPI NOR flash storage.
They are currently defined to be the same as the AHB buffer size.

The SpacemiT QSPI has an AHB buffer size of 512 bytes, but requires these
four sizes to be multiples of 1024 bytes.

Define a new field sfa_size in the fsl_qspi_devtype_data structure that, if
non-zero, will be used instead of the AHB buffer size to define the size of
these chip regions.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - The variable used in fsl_qspi_default_setup() is now "sfa_size"
    - Changed the subject line

 drivers/spi/spi-fsl-qspi.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 2c030dd6facc7..46a3187b33548 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -207,6 +207,7 @@ struct fsl_qspi_devtype_data {
 	unsigned int txfifo;
 	int invalid_mstrid;
 	unsigned int ahb_buf_size;
+	unsigned int sfa_size;
 	unsigned int quirks;
 	bool little_endian;
 };
@@ -737,6 +738,7 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
 {
 	void __iomem *base = q->iobase;
 	u32 reg, addr_offset = 0;
+	u32 sfa_size;
 	int ret;
 
 	/* disable and unprepare clock to avoid glitch pass to controller */
@@ -795,17 +797,17 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
 	 * In HW there can be a maximum of four chips on two buses with
 	 * two chip selects on each bus. We use four chip selects in SW
 	 * to differentiate between the four chips.
-	 * We use ahb_buf_size for each chip and set SFA1AD, SFA2AD, SFB1AD,
-	 * SFB2AD accordingly.
+	 *
+	 * By default we write the AHB buffer size to each chip, but
+	 * a different size can be specified with devtype_data->sfa_size.
+	 * The SFA1AD, SFA2AD, SFB1AD, and SFB2AD registers define the
+	 * top (end) of these four regions.
 	 */
-	qspi_writel(q, q->devtype_data->ahb_buf_size + addr_offset,
-		    base + QUADSPI_SFA1AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 2 + addr_offset,
-		    base + QUADSPI_SFA2AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 3 + addr_offset,
-		    base + QUADSPI_SFB1AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 4 + addr_offset,
-		    base + QUADSPI_SFB2AD);
+	sfa_size = q->devtype_data->sfa_size ? : q->devtype_data->ahb_buf_size;
+	qspi_writel(q, addr_offset + 1 * sfa_size, base + QUADSPI_SFA1AD);
+	qspi_writel(q, addr_offset + 2 * sfa_size, base + QUADSPI_SFA2AD);
+	qspi_writel(q, addr_offset + 3 * sfa_size, base + QUADSPI_SFB1AD);
+	qspi_writel(q, addr_offset + 4 * sfa_size, base + QUADSPI_SFB2AD);
 
 	q->selected = -1;
 
-- 
2.48.1

