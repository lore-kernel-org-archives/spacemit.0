Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4927734B403
	for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 17:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242369; cv=none; b=WDGO0z/tTfXG7uJJe1RF6cUSJBjna6LZQppr2dvkXVAagMkZx45YDYV3BjRcg82hy4VwHBWgxgDEDv9IwIjfANCcxR7pfasdaUGXL/qfRD/62eFW8Z4IH5gt+DzGV7At6kySzLc1db63GUup10JO9XaOOnzyNCl7trtG4umiN8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242369; c=relaxed/simple;
	bh=49BNiaivaAVSLxOrAbQ3jcqUXbd5xtLUlvJhC8tkIpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eI1GMvPpks/ifaNp0y5Fg55NBwUDLeVjDwl0A6fkEHoH4mgukRZl/MJxjiE6jFQfBx2gu8Gq03kw2Zt71upZXOsX/4UA4SfjJw7U3xRqpAQYFSgyMYCnjnWKxaCcn2CeyNa2ltgp+0OkxTWI1VRzXwT64uCvr7LqulBsL9SvNJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=cedD8qKc; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="cedD8qKc"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-27c369f898fso17228325ad.3
        for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 10:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242368; x=1761847168; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSMHyHNn/1vbJ7NUSylLHrrY4cYCxvOBtERxkVz+doQ=;
        b=cedD8qKcYbgtGCKs7medcd5E8SFwSqXlG7DgMMWRj1mY79PahmO1ohTWU++iupGDis
         S6CucfRK8zK9wkjEAD0xLGsdDKx0ANMDdRKCVc9Adg2dLRU+9CtO9NtaaexuzHE09UZu
         XMVT4fMTfGCX02QnkMQRT8R22qyR9hOk2qiPwG8C51cHTD8C+hCmNYvOLjUGUw82vkcN
         K0UpjfXF5LcoaA6rVbNXx0sQI8pnvVwkCRl/hn1j+JQCll8L+kxNyObHKUU8EewL8/nM
         0BPCY6qDPzLavNihcy4r6DyU5tAgZawMp+Jakim3QQ2ASZ3B5rKNIyu5d8U+VHduH8cB
         HCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242368; x=1761847168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSMHyHNn/1vbJ7NUSylLHrrY4cYCxvOBtERxkVz+doQ=;
        b=hQrP/AyQxSFT+3zTqDxgfa3tRK2Lg2Gg3FaxJFHMb1oAKtEKaOLkbMVzKXENjWCY/v
         xtku3FMvMhgJeI2U1TbbRYeE/uEUa5uZlF37GB+GZMYN5HN9gF5x5rZNs7SQFzxNJ14k
         TCzu1fkPRQhXM8IGLrEDft8UMTibXRxBJ0M1x1/YEGTeK5tPKzQTnD+A1hrO9pz9NsrZ
         Ds1vIB31DXRSKhoS0cqKT+R9e3uHHV7P2LEQ2/5l6oo5M6gMAWlRO+vVz1C4ip7N2jag
         MET77c/ntNWS8gi99A7ah6YzF4yNgteCt6KX7Gu9m/9NjfiCyXTp86Tq2steNdOe00OJ
         PGMg==
X-Forwarded-Encrypted: i=1; AJvYcCWO6QXim7TJceUo8lL+bgAigJpackgZz3CS6vr3xU9HwQA3rsCaNxVV2GirvCDN8OlQh0JQ9+hG0A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLh9A+XtZXaSHJGLxvnP4XNH0x/TeyZLSXUnheSF5CREuYDW5E
	DGQ3Ls6eZckngS5/7no2LUgb4Lme4ePd6UzEo8Eml/3y9bHC7sTV3uLHbRxmzFPCZMk=
X-Gm-Gg: ASbGncs3z65wtixP+gCjxFeTc8Huvk3E0rt5HTF3eIN6EtLgMkrpNxRQbFdtqwctaAw
	7i77KhuAgXb5ifK+Cu4leD/hkbppaeWY0b7PvUoeTr3Y/T3Ke3eupBmU0h5iiwXP3iLRd4PG2W5
	UsvXkVmM70T4ZLtb2UhEkSjZpxTA92LJpXwVmF9CyzJK/696PETmat0HpNU61dPdB1mLX4MDdEC
	nXLGa1ugYQ8pdxqPmql6kiMHewV5tldYRNmDTORuQbv1PPWAF7VvrFFrhnX34iDABiC+DZugdgD
	bHtHgA00vV5i/RV8sQZmTtq0YUJmwRyeGTdF6VW5xqCIXG7r62kFa+qdpruRgV017fJrxSY/ODw
	jkGfBx6nIkFL9nFGWR607Oq8PZBuRQ7e09/ANs12lwSLwYnL/jS4RKWJiRQHT7SuhowcHc9IeDZ
	Jl2WMzDZ8/ql8Tl45uajGZq+iMh4hYYxi6aA==
X-Google-Smtp-Source: AGHT+IG5ODtZ8NpgnPdL8N4UrnSSIWOWkDsOvPyVBDaaByRktns1SQuJqvUf+UP737qEBLe07B5fFg==
X-Received: by 2002:a17:903:440c:b0:264:8a8d:92dd with SMTP id d9443c01a7336-290c9cb8b95mr329120295ad.20.1761242367696;
        Thu, 23 Oct 2025 10:59:27 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:27 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] dt-bindings: spi: fsl-qspi: add optional resets
Date: Thu, 23 Oct 2025 12:59:14 -0500
Message-ID: <20251023175922.528868-3-elder@riscstar.com>
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

Allow two resets to be defined to support the SpacemiT K1 SoC QSPI IP.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - The "reset" property now only applies to spacemit,k1-qspi compatible

 .../devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 5e6aff1bc2ed3..edd3158a6f2e8 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -55,6 +55,21 @@ properties:
       - const: qspi_en
       - const: qspi
 
+  resets:
+    items:
+      - description: SoC QSPI reset
+      - description: SoC QSPI bus reset
+
+if:
+  properties:
+    compatible:
+      not:
+        contains:
+          const: spacemit,k1-qspi
+then:
+  properties:
+    resets: false
+
 required:
   - compatible
   - reg
-- 
2.43.0

