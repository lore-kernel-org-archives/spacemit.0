Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B881E47A3
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571818; cv=none; b=slQUONSPo3dsxk6UCxc4lfn3J+ArN0EfYxAipsOEf4wVF/QUniRszO5ao54dbpMJgSnH8aZEoLkgbfPkaDL3hblUIp5yokNNGBFyNaavkr0ORw7EOsqMjLVnlDQB9riBmCFGIfALhwhFAhPQhBBHFTgeSkGal6aBALXr5TwYDBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571818; c=relaxed/simple;
	bh=r/29WdZEJajnpJ//0j5XUaaOQFUOGpajFSIL6DbCOUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9ZS33j2snU9tbYRdK4U81pS/chnF0ZpEBpx5NK62LTMgI5JL4mnxUpgCCG3MK5/wCpQ3hQn3y/4hy+eiqau3r3UwQrB4odlaFfAWhEaB5XwlcKbv9lbjlMsOq0Lvxy3zdSjn7//q72enG9ZitW3nvH6EKhn7zDIRLKS7tbKwvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ZOmGMH2I; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ZOmGMH2I"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-430cd27de3eso21019885ab.1
        for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 06:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571815; x=1762176615; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtUb4xhiKPpq0C8FtRKPFcwQ9IWnX8JOlp4x+Bp+m94=;
        b=ZOmGMH2IYLd5G3atMDMkElNC4V0xd6iJxq2hnTgibdM71q2PoWO83gTpq+lmjdRw3z
         uq3yrZFD9PHGikbzRZtCh722xuAMcnoVdoAsIbsuWRxsowVod1sw/eK1js5uehZ8iaW6
         NfVqu7bgHZx4S4NIUuA8TdRezTJXe9weXbEsx6I/kOctgtVy8fc2oE9xv4mVRhL0xOV8
         o8NRCmEWsBdEz1KSBLfYzN4J2CtGl9wn6K8/BjjsAMUNYOz1zSHjgtiTEkAFDhadklS2
         Ln7AMis86sdvN2jf7p+TahMhvr7fOSf7B3eRp39XwC82OThWdUQf8aKIxHZSaUFFcTjr
         t8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571815; x=1762176615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtUb4xhiKPpq0C8FtRKPFcwQ9IWnX8JOlp4x+Bp+m94=;
        b=H65UrMnS0dKeNdbb3g/UNoXr2zSfuJg7ivXXCtA41563qxq0mqDieJTendF6xijfGe
         RL099nWIH0SmH7W2yacaDCNBR/054lXP3BFbHi/RWpF86XHKIDh7hJEWkTOtem9CvbOT
         FAXe482xwiZFe5/CUQnLns4dV1ZzfjNRM6qMB7jk4pwY/VWIEDct3TaIGXaVa/O983Dd
         19GQdZ8z/PAdZFiWnD+XoUQJLgF1K8b1ReK9YcJQGdKCugx51MD1aw7z5XGmrQWfniac
         c4tdlyH4e4w2EgxwNrj3ttfF9pXF1dts5vAFdqsjOIYIgVTpAniFG13UwpVoIYOGXThO
         PglA==
X-Forwarded-Encrypted: i=1; AJvYcCUny9Bt4Eoq/TWSyBQGBvLtvvocEB3Q3cC9eQ0cxV+HTvMD4s3CJxl9+RSJjgj+eJcibCsCE/IfpA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFLY4pyTT7XbJwv9U4rB4+s6jxmdGqvxiQmyULiJPvHuPkRYeY
	QZRb6J7wW/rOj2iYDyiyg2y3o380PxqsH6B7iu/lS0lYWbNib+u3UXxVgdFS/3zaEk0=
X-Gm-Gg: ASbGncvV1GqyKLHTDNJIG2QSopf/kI8odNTynUVP8L1HT2ZvdADoX2fom1wNZpCI3AR
	1OoaMoekDEv/S0VMvRje43lgwPFl5N1arjE7gyKiI7CRPzH7ixg5zHKnR+4NNvyAZOp1YwQ8xkN
	LyxYSB7mtfXirdevw3UQFncdRRTK6llbax14nqVjffl/GIWKOXB+jLmkFc7ke44tjdVnRG+Hz+O
	88P5Oh1JZvYeU2EX7wPkck1/rUHtkIoszDzn69CWGAtZ4jqyQy/VMpgn7g55yaeON4oX175CNwZ
	y80WBCn8dGiqHzQtWoj42qnj5VOW8eYAwDwGUiRHKx4FPi8/XYCU9orDJ6VULeSHRkuoU6udIEO
	FttHZurtlPIk2p65kPkay82gg6WMAuj6QN+J+MkyA6LyJS+8a7XFdTOv3aq0oOr6/ycQgGZ+UVG
	cWYCN1evcVaIFCyQumLnU4NdzMrnIvZNsn3LWYu6iXu1vPUKT2QZkGew==
X-Google-Smtp-Source: AGHT+IGIaa9c6711RS9OGQdRfQ7Rb3CKIGdpN5d0nvSIOXYlsYNxZJWsYmkF9NyaMUyPnxGqZ/xfcg==
X-Received: by 2002:a92:cd8d:0:b0:430:cfe4:6e61 with SMTP id e9e14a558f8ab-4320f7dcd73mr1143985ab.14.1761571815189;
        Mon, 27 Oct 2025 06:30:15 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:14 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 1/9] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Date: Mon, 27 Oct 2025 08:29:59 -0500
Message-ID: <20251027133008.360237-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.  This
is the first non-Freescale device represented here.  It has a nearly
identidal register set, and this binding correctly describes the hardware.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index f2dd20370dbb3..5e6aff1bc2ed3 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -22,6 +22,7 @@ properties:
           - fsl,imx6ul-qspi
           - fsl,ls1021a-qspi
           - fsl,ls2080a-qspi
+          - spacemit,k1-qspi
       - items:
           - enum:
               - fsl,ls1043a-qspi
-- 
2.48.1

