Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1ED32ED5C
	for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979122; cv=none; b=M+TciGfPbYVJijX4j/lgpW7NW8bGGwAbXP2QK8WcDIKXBDa3+XhFqX26DvNqJVQxmSrOwjL3b7svg1Szt/vPiZkj8EJW9ktjH4zX8kGBAJ93Hvh3bLiVlnSvrTuch5dccZxnggzZ72ZmLxPERoQModcmufTvTJ83lectY+Ll5Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979122; c=relaxed/simple;
	bh=gzZET6mP2OucMjDQ4thYViOeZ8/OsV2OQsQvxJj19l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7uOvOfzWuGpLe4Xlb+E5BDeJ+68zhU5Yl8U+wrv/7z9tq5569EbNR5whYo0JJH4Q6cD6eU5Mt1hSY1B2qbTcZNGoflPPHDQw5I31K6MwVR4x47hGogPcuB26BE1az6nfzIYMVylOgGKE5lIlIWS1Z3tbCdHCEZOXBaSna2YLGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=EznRoHsj; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="EznRoHsj"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-430e6ac6bccso3500985ab.0
        for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 09:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979120; x=1761583920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAFHx5Fe28+JucgqjXAxBLPfwtGRK1k39/wAp21/umo=;
        b=EznRoHsjkNVx6ju53WlqeR2fwma3bYPpYjKGaaDZPR0ZMEVuR0eH7wCv02RTqMlSXC
         ktba9Ro0m/XWDHxNLhVoRwvtCsGmUijhf+X/VQ6fFVTeNz25SWFDmrr62A3Fi4bhZPze
         4TNlxSXSugsPL49VrKKp0q0mR1U6MUEmZ7COppPFEQ2pAkKWZ2rep3UPj9plRWVW++xA
         IJB9is0CvRF0/uQTIU24oJKB0GDqoxbYsqUTeF9AN6VlK4oqa6ikS8XTkld2B+nwdVt8
         eTSf2PDaC359zCM7KSEh/Rc6XHyiKxt3Fu7sWyotVTBmhUqgjxuA0Z7QKVLp9pcQxO6i
         sc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979120; x=1761583920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAFHx5Fe28+JucgqjXAxBLPfwtGRK1k39/wAp21/umo=;
        b=HTJy88vEFE/AdJEY4d5K/kSsQrJcCz1h/JD9INp5BSOmLgZlWTrly/LBh5T44aXf6H
         Vo/zxEK6CnaXZ16H3YyNsX7qd6WtkUqt1gTkdEwg8UlyXbbQe3wseWKGnRnJ7fED6Sbb
         PztdcFdkUwan42vC8dOkz+/BWr2lVUsDkfbvvPUgNxe8FRT8ucOp4yyx6jf/6v+4y3wk
         gq5kdJ1eIFlbxldmmw+AKxwHiFU+ujpUQzmJK+b+DehZmhlvu+a0xg++sVaNhbwYMEV0
         5/UaAORNRxhe8+BRWiaZkP5yB7CGufsnqo1Mm8TFRZG65qlndccRtRk4Jhn4sOXkOyRA
         HbTA==
X-Forwarded-Encrypted: i=1; AJvYcCXAtQ5E3vgUmhBr0yI5GceheU2KqcU35QC6PBQ3gOfcIWRW+nA5mXpD09MgJD2CCTu2eUzkQ5Jhxg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzC7pZyOznATZsoEhlIMjbyrSeRl0+8Ujbs3eD6ZgLcvFDeztVv
	2XNcEIXG3XWk0cbR3IFK6QWVX3vq46HgRw1z1jZcfV7FFniD9FGIMCPwIPEpq6TAEfU=
X-Gm-Gg: ASbGncu8xzbLT3Gl/UqxhAUGnssYP0krS5SnD1AB5vppYC9ADZRI/CiQZab48alpBss
	TrvrmI9jaaQcQjCvGsCvlbD7n3MRZxJYbJ41CFKyG5O+18z/gBhY2GhNTX6sua8U8JYKRUlVLf3
	pq8QSdSNBa5Jwa+RuyCLFNumq1MbLyZVYLmt6eLxZNKbZ/R76okMKsopR1dp7TeiEGYGaSP27Na
	A+RmO4Z0Ge1reJtZNj73D/r7nFAGUvRkU7misEE0LE1YR0iWvveQ5XQh2AMTk80Qcj+CLfku0+N
	tadcCMcGmLsMrbsBMglLPKEN3tMSI+Ci25nDVMJG6xX5jbx0JfUvxVs57QRe2LuFPAqe6MByUfi
	enxDFVHvHB0eafEP+yNXiHVSxpg1D56fLM5uZIHv6L0CQNUQhPOspptJKStzUZphWG4oqQm58rz
	N8UG6jlaQcra/ONDIO3UTfKhs+QbzWjDxArbNoLkrewNIEJt3BmSF8Lg==
X-Google-Smtp-Source: AGHT+IGrysi/n+6wy3sDQX5W8PX80X7sxp0qMRXdkSjXbUhQItP2k8/GDMxk0YCbp0Wy5FwbdhktFw==
X-Received: by 2002:a05:6e02:3e8e:b0:430:ce63:4180 with SMTP id e9e14a558f8ab-430ce6342cfmr168487305ab.8.1760979119873;
        Mon, 20 Oct 2025 09:51:59 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:51:59 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Date: Mon, 20 Oct 2025 11:51:45 -0500
Message-ID: <20251020165152.666221-3-elder@riscstar.com>
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

Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 0315a13fe319a..5bbda4bc33350 100644
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

