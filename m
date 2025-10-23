Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD1934AB11
	for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242369; cv=none; b=YaupOHE1Ays1DSjHhG2Rk7qPWRDMRQ/L0X23NYrtOz1MZe5ScdNasFvBA/UI0ZABl+7rZy312E4bHnYF6LkhepTCdwt7SsRPiZI8pj3TR8e9UV/RNlTVX1HMxaPZiDBXFsbZndNsT0JVVFDt4Z0HdQYlb/NMRiKw5DcfpNocGgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242369; c=relaxed/simple;
	bh=a/X1Acv0a0Io7YPwnyOgCxxAkklMU8dT+67o6Oa6kn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IXp04jpNYslolw05J1vMAeNEQbGkrtfotYfgGW1kG9bXIRWkuPDQwqFT2qppn59BlSwiRFffn/NOy++P7rVQW4ES4pa9Sdc67Z7k74QFzdiEszxMULxeZwdKHvggq78vVOwUUzKiW3mSRKtgEjk1NdYAjb1RX+JSwAVTgYmtO8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ok2rQ96E; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ok2rQ96E"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-79ef9d1805fso1236448b3a.1
        for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242367; x=1761847167; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfBpxcQetznup7hF07KUJDBVrurA0aaR62AdWj47guE=;
        b=ok2rQ96EihiASNOkCBm7kKEk5CJs9LicMhsBDqpObTqnoNi/URqTLgPAjAc1/C4P4U
         c4zm0IzyQFhptOAJs6wzPLs/TmvRNxeQY9f2Dcg2DDuQnUdOs+756D6CRrhRE88+X17r
         6fKm9cpE9rjd5dWJ8XYiUMXFwnT93PJzTmbO6kuTvgap/ByfsPpmfWUL7BOznHivNUZb
         lyP7TE8lKzeHcgtavL60mex5B+j90g7JJ9b0vPmZwpSovRhx9ai5aTT2pVxES/qzE2Xo
         lsd4XENZi14SN8r46EI/6EI+RDudlpD2nmwLRbrU+yewJqyMrox3OhIk0UeNMs+Wu/pn
         UQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242367; x=1761847167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfBpxcQetznup7hF07KUJDBVrurA0aaR62AdWj47guE=;
        b=GronnOeoUd3x09Nlhue6JGnd0En+Ctq+xuPYRY6pJ7/VygSODsbUvargoRMsB5NqPo
         tQ06FFIt8WDOwPEkYd54rDRDSwgeAc7friuo1WPehh/CUP3YOuxcg8isAu+gwuPlQ637
         QUguJr1r4Zf1WShHarC4+CLTG3+Z5KyU2Y40heA4mwnW9Zf4c4zRQXybjuVoqZc5vm+j
         TwdUragK1Oex7DugB8Ann7zWTYVhnE3/Y2yyRGLu+yLOFCHvzuE00k5ECctpj0LVVIj1
         tn/4q1FwnrAifiDaBbdZg2WrAxAGvmpatEMI++rDq0EP7ltCnmZanxSdMuawHJ3pYWun
         p2Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUUwFMJ418ORZfiAF8krfk5r5rDnWgZEBP2Y9qfBIxONBHWXBNHybGlcFck9504uiPOIqbL6zwBEw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxX5NokcEaCc3au8GUFrc8cHvvPYaZfdWYRnXWCsnQbgM7gXVcW
	hY6Ev6wJCqyXSMruWtnu4V2wCFUjTjZi+SbHIMfqg+N8ve35qdLqWozoLe4zFxnM/ao=
X-Gm-Gg: ASbGncvAY4VjJUV5jP9HPrHGwJqSQM3DFwo3Lz7gBzgg7pOju7oouWAxa1WUpI0WXwH
	jSHM9bZd8J7xAwFw+iTInRjprP3HobThMvu22PO+PNqYgsXAEOxsaxYX41/HaGbkP+zQspVS0xh
	tgI2f594J7mosZzcvsL6iEZhMyJK4ky1qFFmdE0+st4XPRexeIXraxzl49cBdwDcM1cwquo94gL
	3XledVAnn5vwt75UTbWYvFptY0WZwnJ8PsO7ekIok0GmItm4mEqWYOStXdpouAT0ERd2B4T6VU0
	zYkBtvtPLVDGlQA4HxeBkoYWo4mQHSedemPMIvldcUW7Rd85YchemFeqWmPXPpN/e+tG/lqkgVJ
	yTl8b7uhPrQLNC5JGaISg2vZqhXUBuqqmMbFil+IuwDd853IpfSHkqS36AGK52z/cRWdaSbmd5y
	A3F0ls5iq5jz/Qak2dC3pMOtGeSY5m+m++1A==
X-Google-Smtp-Source: AGHT+IEiskDsftPBzROd2WKzvcPRxdNUDdrslLqgJ10XkgDdwMsWJwp/kE4fHkTeBllQGtyODL0OHQ==
X-Received: by 2002:a17:90b:4a47:b0:339:9a71:efd8 with SMTP id 98e67ed59e1d1-33fafc8fd43mr4507074a91.37.1761242366629;
        Thu, 23 Oct 2025 10:59:26 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:26 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Date: Thu, 23 Oct 2025 12:59:13 -0500
Message-ID: <20251023175922.528868-2-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023175922.528868-1-elder@riscstar.com>
References: <20251023175922.528868-1-elder@riscstar.com>
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

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Point out that this is the first non-Freescale device used here

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
2.43.0

