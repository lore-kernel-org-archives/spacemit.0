Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B420D2D7D42
	for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 13:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408814; cv=none; b=JA3bFbfjhivvXPQZxYG85qElBaIBJtlwO1AFPRVv8VBCtamVeOnA/LPVAU8asCoLGOjzKIfOrswVsAyHpQLcf8jt3bFQlguTKQbMxjVdy9OfJ3E2pwaNt2mnzDjShiJSoT59OfgyEyKT+WmHNL8b3z6asVRVRicDOK6Aoh3PNE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408814; c=relaxed/simple;
	bh=zt6I6EAytFR8ggLCy61krEbf9jT4HMDJDCSOrojN5mE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JrrmEs31tFpMbUB4SukzR5Pw9gkaMrmj2fSkv3n8PUUZIcID2EKgBLZAYkw5QCcCx+iywA4INIDdn5u9Xj9kFoT9dc63PAqoL3w35ejFiPyyihO54nsC95GnLJ3Gz1h7rCLVe2RRGQXrMkh8Z6SxNf1Sl1hOZLM7tY6qPDL4T2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WZ2dfpCB; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WZ2dfpCB"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-bcfd82f55ebso1849987a12.1
        for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 05:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408812; x=1767013612; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZd1WuVDHb3KQSVAGlgKp7AEdPQaqmn6KEKfxdPwWwg=;
        b=WZ2dfpCBeoSqgAqfr+fFA+tYkFsQUx8NfbX/2vuzyokSo8O+Obfhlhd0G16XBld29Q
         yzEItpu/F3/N4N9uy2pu16Eis2XOiX3H6qbePkH6MqU0bhLsIgtSszoDLkvb/efQAmdZ
         E97zGBJRzGLyYSKcwHw/vbMbr2+8dh0IeRIi7wbgIHrog7xd+XLbUPRAVcZRBnQTA/gb
         +itOIUbvN5uqCmyK+ZjxwABiCSeC34kcVtFjayyxAkG4Zq919JQUDGR2UDYRa2gk44O/
         rs62ShS0BMZiN7Fv8SXCGVjXMSzB++wS9om0IAmAmfqvg0g+PSYBRFmDDpm8dC2JXdNB
         SOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408812; x=1767013612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dZd1WuVDHb3KQSVAGlgKp7AEdPQaqmn6KEKfxdPwWwg=;
        b=d6tnNrw3qe1948aup6qu7Wr9+/mXWIMx89tYKoaKhGC8w9BT0tWERyZuMw1h2exvIA
         N/3M1TXZeejE5FFbv0OOAZGjYW7hmJ0jrL7EufR0pE6YnkH56XOvZooFddP+kobCP4aS
         mNH2fbhf/bll6oTGzVfdPx3+26TreEpbf4tFQ/e0cewAZX+b97n89xBxnmgUzgXmi47I
         S01vv70bbDphhmaq9oKJcT0RwnK2eHfvlzE3mG3BIABb8RdL0RfRQ3kvkzlryljwgIeG
         e56Bsg2BLNnwTCbifsgBQvz7T+ouz2hbbVG4+x4Dy45JzFK7ugZL4zadV1Q3TnPYOA1z
         YRmw==
X-Forwarded-Encrypted: i=1; AJvYcCVfijh9ZM1IlRZSxeN8G++u1c8aIE8ZmmgDM9imA6xST76WCcuidEC3edHDIzOiHXYc9+b8DadALQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3kBDyT1eEqm9i1LryXIvGbpZ7UvLt0toYR+lulXM2vDMfnXy0
	I+Ik6LLQX8q/Z9mnBJaTk0zeWmpCFxFp9PfJ3Dt9x2csIlvund5E5YVdwGfqk2ev6lo=
X-Gm-Gg: AY/fxX49aDxwK6RBqd7j9+drGkVAc0oc8JpWUt8fTJFaHGmXr+OifscmVPBAUY6gVcg
	mTgtm/S3z1CoEu5wdwhY8G8eA4BHVj0CNQiSlPsb1DfHa/W4aClQwRZOQHMiULrwyRuEyuUxlUw
	VuxI4tw7e0brWZ9AnzMSnf5KZDPl1BRQSPOqcTuoKtQ/2c5OsE7WUfiqtLWt5eED4owYkw/CFoG
	En7CrR19tpDS65CMewBExjkcTY+JK0vpr9XeqSJ2O41f3qN91w/FEVt9TDe+Ho8g58a9NOGGO9r
	3K5AEvZgkU6i216U4OhdfJOCvUFf1iqkVTuREqFeKsWJMUwqjdOJFItsJnAvp/eBtyCObNAUVdN
	iCR2Ie78DG60OGCz+IoZji1D/BXl0a3cCpIEtA5JO5UYYGEE6lHr1mP7hysVoSoSPiyET5RrR15
	v9g/z43CAx4DWAInwQrQej+b8oBy/kfCU=
X-Google-Smtp-Source: AGHT+IGPSlitj+KdxoHkSz2WMJ8tmr7DZSG1VelElp3zzCiMbTqUqeMIJpXpJbfUrLndiBON9Fx4BA==
X-Received: by 2002:a17:90b:4c4a:b0:343:3898:e7c9 with SMTP id 98e67ed59e1d1-34e71d6901cmr13057876a91.2.1766408811887;
        Mon, 22 Dec 2025 05:06:51 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:06:51 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:13 +0800
Subject: [PATCH v2 03/13] dt-bindings: interrupt-controller: add SpacemiT
 K3 APLIC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-k3-basic-dt-v2-3-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2

Add compatible string for SpacemiT K3 APLIC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Add Conor's Acked-by.
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index bef00521d5dacc002d24c50843ebe6380a7d5524..0718071444d29fbfa36283fc9666e8cecd6f77e7 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -28,6 +28,7 @@ properties:
     items:
       - enum:
           - qemu,aplic
+          - spacemit,k3-aplic
       - const: riscv,aplic
 
   reg:

-- 
2.43.0

