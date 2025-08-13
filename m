Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DEBBE65
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 03:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755054824; cv=none; b=q9w0cHXXsH2r5ChJ5uEAtRH4RfODnfdcmPshJZeUpc5ChO1pyjruZsaBvyC9SgyhDthWX8yljNz9Dg01kSZGE1y3e3te5IMuNnFgTE3P+BI6Fdxxp8XlZe2KqU7T56Y7LtDE2CBj3uOl34YF/6i8rkDXeiXD2bS3zbVGm+P7G5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755054824; c=relaxed/simple;
	bh=4e3XC4i6uPEnWMRcXdvMk1P32JDvw0n2PeDK+VlwzBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uxkfg6u4MQoMMqVq7lDtHjohcgHYgxCQY7XtCO0oWEtrssSiU6pSvmYuhzY1NG8BmXYFR7lf4UIG5hdN4t9XhLR3mzeU1sld6zOrhsyXMtBXIedR5xgkivBrQ6L94Ru1INHVZjJE8svpMxn4UeBkcy7+sUFvQPEt4v6/3vueTLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Do3Rg/JS; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Do3Rg/JS"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3e55b170787so2614765ab.1
        for <spacemit@lists.linux.dev>; Tue, 12 Aug 2025 20:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755054821; x=1755659621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PhVQGmNNzCiMu9pw3hx+9YH1Eu7sHoNmFIOK1HnGfI=;
        b=Do3Rg/JSR936mwXMkywmd6wN1bRMdPTdmFBlStaKwL9w0yoAuvHbwplCqfQJMIybKe
         mUR5btNhzN2fSfI46ubzaD9ORTK0rGFKPPIKa1rEgyOHQO4N3uo/Vs9198F3MOlkd/5a
         zgV61BKiuWC8cTcj+/48fGCQd9uWcrwuIWUdugTjADocqplzlo9ew5kVzxHFDMdT92Br
         DdInpKDU6aR8/aS8cnmNf5MqHqf3rKE8HY+05SHLH0sEfqkz+6+MiJ1jkTcCaCHBsgQ+
         CWUIiZPZ5YLFOO6Z73HOIYtxj0H5siPxPdkyFzcf1J3m0+xGg23N6thzR3+25TjN8IJy
         XM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755054821; x=1755659621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PhVQGmNNzCiMu9pw3hx+9YH1Eu7sHoNmFIOK1HnGfI=;
        b=AcF5Or3yYBO0AbA6LC4yZxrTDKOLSIEz/9SgvhPV/QdJIZzeLzLGB5ZpGV83uFrxrz
         5GZznMN5mNRbbJcg87gmV3ygrCgvQrxhQUBK+v4NBBFza3442/r3mkNGFHwGKpVwm4Bz
         HF3oGxRz2xJoe5arx2g/U22ukL6b4vP5ul5WgKQeAP2E0i4U/oy4rURtx2nAEo6Oqao9
         OZPbKJpKcxBSTglHgfrw/tpP7zzMpL5skykb3Eq9pboXWpoXck5dRABhoUPweexONB5f
         AtBvMcHgHtceS8TlZjOE/Kja4zosdED108AhaW0qwxkpkKkY0OJb05En7/0kwV4tWbV/
         AlqA==
X-Forwarded-Encrypted: i=1; AJvYcCXdrdarhgYHd1PSOJsxwiawHG7A8/xIGXZUMC9BlAP+gVZFxoViK0P+a88p4Pj5fBjMsbCV4IrHkg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3WFMrLb5mUNBMhJ7oyPY94T5dkc/C38szLISA/0EMpK7M6qDr
	iqVIPgOgxU3NMtBZaMgXMf/Q4TSHQmnOqnUhdMooAGXFSux0ZpxmfxE6oSS7mm4YWL0=
X-Gm-Gg: ASbGncupaFB1ViMsb0nKge9fTGeEL/7r9PuMCxdqg8Hy6RLzUYvf9mJJMQ2CUzU40hg
	cCPdormg+Gh4l5pBOsu0ptNZyL3lEQ+ZoZRpzjzpZNmSrXeM82/B0u9XzF0pHgtKd9CGc2n+CYC
	6yko2eyJ8scqjSLJmAc+IiS1ymtNSO9SP4wmnCrU1d6W08dq0WKCp56k1R2589nRVvAhhC1W2lF
	LEVbcB6f3nm9kEv21A2v4UCgnPpVfDTJnTjySFdzQ4CXb4+GvCBGHFMekUXqf70UOqiqp4u7bD1
	6pV5Hh1FJ732nBdmRmTTrSZkGU6bZKfrzjv2OJSv7H8j1uen8KnzB+3i1an7AOqORTyttURnpEL
	ikcPKG9BKZdk8z92unH7XMYQgoXn79+tGcY7a2Q/pFAD4lWXL0DHBR9jgFsW3PWU2gQ==
X-Google-Smtp-Source: AGHT+IHJ3cV6K51nVGXbggkk4n0mggTrNvjqK58YjsUKI/uGamOMw1V+7ccv0fj3Is/jMTtEld3VjA==
X-Received: by 2002:a92:ca07:0:b0:3e5:55b7:1eb5 with SMTP id e9e14a558f8ab-3e5685ab4f6mr13673995ab.11.1755054821496;
        Tue, 12 Aug 2025 20:13:41 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfecbsm3616330173.62.2025.08.12.20.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 20:13:41 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: dlan@gentoo.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] dt-bindings: serial: 8250: allow "main" and "uart" as clock names
Date: Tue, 12 Aug 2025 22:13:35 -0500
Message-ID: <20250813031338.2328392-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two compatible strings defined in "8250.yaml" that require
two clocks to be specified, along with their names:
  - "spacemit,k1-uart", used in "spacemit/k1.dtsi"
  - "nxp,lpc1850-uart", used in "lpc/lpc18xx.dtsi"

When only one clock is used, the name is not required.  However there
are two places that do specify a name:
  - In "mediatek/mt7623.dtsi", the clock for the "mediatek,mtk-btif"
    compatible serial device is named "main"
  - In "qca/ar9132.dtsi", the clock for the "ns8250" compatible
    serial device is named "uart"

In commit d2db0d7815444 ("dt-bindings: serial: 8250: allow clock
'uartclk' and 'reg' for nxp,lpc1850-uart"), Frank Li added the
restriction that two named clocks be used for the NXP platform
mentioned above.

Change that logic, so that an additional condition for (only) the
SpacemiT platform similarly restricts the two clocks to have the
names "core" and "bus".

Finally, add "main" and "uart" as allowed names when a single clock is
specified.

Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional second clock")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.wrC51lXX-lkp@intel.com/
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index e46bee8d25bf0..0a05a1647b5cc 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -60,7 +60,12 @@ allOf:
           items:
             - const: uartclk
             - const: reg
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-uart
+    then:
       properties:
         clock-names:
           items:
@@ -162,6 +167,9 @@ properties:
     minItems: 1
     maxItems: 2
     oneOf:
+      - enum:
+          - main
+          - uart
       - items:
           - const: core
           - const: bus

base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.48.1

