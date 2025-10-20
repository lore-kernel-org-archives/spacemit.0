Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790B6330D34
	for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 16:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979126; cv=none; b=qjPMUnEVUD8E2q2xofB/KLeAphLffsEqfvvPQgaypV3NqUKB+nI3oFrhK22xJ4Tw3AXeRYLiu5rrvaxHYwlC0tyZCDaZfQZOkB3SfePUzSQuscfuEFTXTuuvfd/9JNZ+RC8vK4pTyKcAk3LH7qFdGmlKWkMGiED/HJPwja7MFGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979126; c=relaxed/simple;
	bh=MegxqgosTv1U9bmqdWFqbKF2SSWgJ06/KUsVUL61nw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RNWdUHpaNjv5GLbrQL4Tpb2MPE3l5uW9ODXxkwaZo1sBxDy/F5QlQnATBe10Gw3PbrKEtA4TOTq4/V3ILLThsHEWiqN/ZckCFECrhycokmd/sPaWFSxsOgMXuprJjbR0/VhHIA4UnW1BSQADQaxRk+MCtmu5p5Dlibugl40FMog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=q8WTPYlL; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="q8WTPYlL"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-930cfdfabb3so281260439f.1
        for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 09:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979123; x=1761583923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOxUmFizj9Ufb4EIO4FC5gzTfZsJZC8/cUTKAJuMzsg=;
        b=q8WTPYlLmiT6UfLE4PMA3Y1Fd3OUEu079wrr3w7oi6+7edYe1Emf0yRa7M2Kr4tcgM
         YO56bUJ9Ha5HdHow/nmp2dxdCYF8AR66bjZ45Gi4z7vURFtPfeIv4s1majgKxyoaSRh+
         0Rz8RInBL/ydcMC7pAzjdeBnRHwHDyD1Mmxdl3DoxEovtM/WraIkGk1HgPPZu1FR0ys9
         be8LgUlPFbZST9Oj1n3ay29lg3wD7cTAHQFQYvNMuYycJmmR9YPJuYf1bD5VRPLsGzQN
         HxhTh9M5AUb4IXtXWA6GO3cWHDnWgybaeCv0Zxp1e0N0rfdQXsNZurH1jTZKMGiWnrKQ
         MAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979123; x=1761583923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOxUmFizj9Ufb4EIO4FC5gzTfZsJZC8/cUTKAJuMzsg=;
        b=Z7cc35rnA2Myeh1WOR9Pp8G0BtB+xnZO0hqjSXflZ2eib7Wc1BrpASS7UQcCCfa9Ro
         Vf6iXTMJ219To1S2hKOo2VO6e4sLFO4ytZ4yGuIhxWVqskt5W9ylXZLvzqhBRR3m7TSi
         7yBtuBSV0DMViAsxzKnC7+kvbgeXwaYXnoaY5qFN8w010JMYHj5WHJIEzXG4J8AIEanX
         1ylhkjFUS0AEYLSC3xB94xkr+0Q7W3HVSS1SQGNCNj1jOTGvgoQ+PCPTwITc/Gv6km8c
         zyF0Lyf+stfjNVsQT2IsyK/KVBanaz/Qttw6HthpVA1HIKelBCf71ANwRszdl22gJEAH
         YqGw==
X-Forwarded-Encrypted: i=1; AJvYcCU8iNXIhOu3scoH7XRWa4kkWktWzBt6tMiOWLit9J88MefECWvFh1eR3LQkjwuCWWmcO6vOk9wE0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkK6cDNcqOCvQgN15oDriNOn9EelqOrm9rVTrJ1VfnSJ0rtsIS
	pmgyB9DJRDCn9V4osA8ugh020+GZ1u7N1RdcU/VVBk2zdZhiZEG45ypIh1ucJJJGLls=
X-Gm-Gg: ASbGncvcQIj86iiCNUZaEaYXdSmAjL6ANnfsB+cJVJhjKQzo3ydH6cE5iI2Nh7mx675
	EOXjnX6Xzrs0V4yWFlhWKl9/hEHwUNeXVQyRsYl0bEjfx05Ywr1Y5uYlXm+NEu+i3PYblG3A2A3
	yadIj8ytlKaxko1dibKO3PRoH8dlgo6omf/HaTLZscr4vBKCtvJXFwYzljZi5fXEDs8Y8cGrw/z
	IAuyjC3xmLxidcZ6338fFNNMOaVj+LAZ+0+10REh5cavy2HY6zRbznz5Af6xurRMz8xPSkuNNK9
	c/DbCfeeP1Vr84+pJNGLpKzNnF/b36sUvmGofVu/r+BrQHHinF8BfFHohLsLP3hK2rlwbxy/pnT
	phXlasoHsSHyx3kSPdhdwRGOzWDA0VHGKrDwkLbGDvqbDWTsC2uSgalIxJIPyrw2vAoSRSh32ry
	lfs9yvp84sAhpfvCD83dhYtZnbrLvBpUgzzsdsPn5QsQ58Lxib+nJ/9JehuCCYXqfi
X-Google-Smtp-Source: AGHT+IF/UQC1U4T3O3fIMqDaCL1ih7iPN9SgktMMT7A1RqheXlU2cIQVFeZ9iCADqymX+H06lIfZxA==
X-Received: by 2002:a05:6e02:154a:b0:42f:a6b7:922b with SMTP id e9e14a558f8ab-430b42f1f24mr238954605ab.7.1760979123535;
        Mon, 20 Oct 2025 09:52:03 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:52:03 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] spi: fsl-qspi: allot 1KB per chip
Date: Mon, 20 Oct 2025 11:51:48 -0500
Message-ID: <20251020165152.666221-6-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020165152.666221-1-elder@riscstar.com>
References: <20251020165152.666221-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In fsl_qspi_default_setup(), four registers define the size
of blocks of data to written to each of four chips that
comprise SPI NOR flash storage.  They are currently defined
to be the same as the AHB buffer size (which is always 1KB).

The SpacemiT QSPI has an AHB buffer size of 512 bytes, but
requires these four sizes to be multiples of 1024 bytes.

Rather than add a new quirk to support this scenario, just
define the four sizes to be 1KB rather than being dependent
on the AHB buffer size.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/spi/spi-fsl-qspi.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 703a7df394c00..9ecb756b33dba 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -795,17 +795,14 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
 	 * In HW there can be a maximum of four chips on two buses with
 	 * two chip selects on each bus. We use four chip selects in SW
 	 * to differentiate between the four chips.
-	 * We use ahb_buf_size for each chip and set SFA1AD, SFA2AD, SFB1AD,
-	 * SFB2AD accordingly.
+	 *
+	 * We use 1K for each chip and set SFA1AD, SFA2AD, SFB1AD, SFB2AD
+	 * accordingly.
 	 */
-	qspi_writel(q, q->devtype_data->ahb_buf_size + addr_offset,
-		    base + QUADSPI_SFA1AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 2 + addr_offset,
-		    base + QUADSPI_SFA2AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 3 + addr_offset,
-		    base + QUADSPI_SFB1AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 4 + addr_offset,
-		    base + QUADSPI_SFB2AD);
+	qspi_writel(q, addr_offset + 1 * SZ_1K, base + QUADSPI_SFA1AD);
+	qspi_writel(q, addr_offset + 2 * SZ_1K, base + QUADSPI_SFA2AD);
+	qspi_writel(q, addr_offset + 3 * SZ_1K, base + QUADSPI_SFB1AD);
+	qspi_writel(q, addr_offset + 4 * SZ_1K, base + QUADSPI_SFB2AD);
 
 	q->selected = -1;
 
-- 
2.48.1

