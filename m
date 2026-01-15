Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB212F1FC2
	for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 06:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459957; cv=none; b=dIhdYPWkaxoGbGgtg59DZxU3nUvFmhfe64h+Da3xZQaAvg5znw/27fDYWm1CQ6bHY90eQvEPG0NJ7stXumVIcUBgK+ny9AdviSx+mZzYGfXdSipdZcjiBVI0bMrlPYQhoDpShPt0lqA4K7lyA/1DrpFIEl8W4NdrFeSfcDE1vUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459957; c=relaxed/simple;
	bh=l7hGjeH41ncx+nOi6rKBCh5zMtnv08NYJtvw973zNG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cb32soLSteGng14pmBsQcG/nZroryORUzErBckzApVLvqyBKfoz0pNzU8TwNAhcIrXs+K8/H0DSIkS8SJUKDcLWLtO4eEJfEF/GAu4nk+uQ20ucTgIL4xUzfGCF4XoMIoF0qJ+mc/M6gTG+xSSjclSgXneiCPxfpGbfMSarNptI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hPmw4MeC; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hPmw4MeC"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0fe77d141so4605785ad.1
        for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 22:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768459952; x=1769064752; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkACyF5knfi3YNNtTGrOijDE0psaJA8wPiea8JJZ1Ng=;
        b=hPmw4MeCYfkuzfJTWOwolnVQQu9cL5Le6uyNw6z7pfIgPNZMZNPYkS2N7nJyN+dF3X
         MhFqYPsdT5YSTiaoWkEqL23HHwi/w1hPY+4jZak5ksVI0rG8B7CvhydNtnKl651cTwYb
         DaYVykDH92jecO1sd902GQ0TWZgalbMqaNEBbiwtak9cA67+QvKRnfGStfYUo3F5TXYH
         ZHcCUJvshrOveSHZvt39WFWK/RFnKRZreDgzkAtYi2I4Q4N4T/5gLpA7w5EDxIVDdUEK
         bXAcJsj2eBUEZZH+84v4p62UgjNv27dJ1+T2UhjX2pg00fyjo9AIQKn7or0qftGWYIDI
         tO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459952; x=1769064752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SkACyF5knfi3YNNtTGrOijDE0psaJA8wPiea8JJZ1Ng=;
        b=BgpwYV0M/4YpQPhMrA04GTFbtrrcR+BiCEWB1byR7leTfBrm9RF+IVS9RM8uPvxlyU
         nCg2iKaRmBLuNwFtfi94o+/0zllUUswF88Co8GRXyop5F9rJXANQ8xhRPKa0NqybOoFa
         F2JB7+npS45sBlAJ3zx5KELuMCGyf/j5Gmqy6bzO/Dgygc+p/jObbpngBA7H4XuBMuV5
         YHQlj9PlUbO+Vk9hyrgczGLJni5LIoYEQ8TJhGv94eunsfrXS9pywIStHjJQapL3ZLUl
         d0fi+XFHE4AgKfSkkRdvBvceFEk1Ep2cNsD/eXroJ7FoGWD4w1LWlypib5iTW0RVHHSt
         up5w==
X-Forwarded-Encrypted: i=1; AJvYcCV3O42MVsRocGEYktRS9T+eGURbyioNBS9x0173v8tos+hZ7ozjLmyxov/g/qJ2sMEtZPwXgQQ53Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+bG8ayFTuxkld84VFnnl5T/Py2rpM2I0Y46u64a6zwI9cjPO8
	zeuf6Q592VpPUVLyb4JkdZLg1SSgW38+y6QyQOeeM01qch1lPMxfo4SNylGFVoJQKqA=
X-Gm-Gg: AY/fxX5m/sOVF7FzX06UqE9fDIKcmHGjGtLjZ6xHKkwGcuUpIRzdfop5hgtetCw2Zei
	wJCLvX8IX5LJknt1w7b88wJoycRW7Q2v7NxZqBedbBtEM9cu/m7jUj4ncVRO1CCLESzb8iTEzTr
	EBuak5Ets6TCXkVLG94B4mjQDDU/wYbI5oaCRZfZNT1aFZGrMqnEGO0JHnF30VMshLHd2MzEUze
	JENtBi+tFg5nLxUhIzunjc9+dwFZ/vnzVZ5isUI4DT9/pjOQPjfzxrpX0uHweaTajHhK5cHMosD
	FCGUzX1ByqSvRTZw8Vo+nByyHnJVdvn6ivOvFRyfqb8ixvBkchfT+N/YvNCGVfNXXAIRyIPHEcF
	oBpEF/RTF1rUo1S4bGOLyAVkEG5BDiLMlSYFEWcfQHp0n6C+wz2eHKcm+pS/kFRkFYzGtPqgMah
	5gGt9fUmK/uGZGd/+3xJQdjgeKkwdZH2NJt3+gr1RzrNbiKDkvsrWFCEQfjSQSTwJd
X-Received: by 2002:a17:902:ef08:b0:29f:5f5:fa91 with SMTP id d9443c01a7336-2a599dd69abmr51861225ad.27.1768459951907;
        Wed, 14 Jan 2026 22:52:31 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e7a3c6fdsm235081015ad.15.2026.01.14.22.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:52:31 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 14:51:42 +0800
Subject: [PATCH v5 3/7] dt-bindings: interrupt-controller: add SpacemiT K3
 APLIC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-k3-basic-dt-v5-3-6990ac9f4308@riscstar.com>
References: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
In-Reply-To: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>, Thomas Gleixner <tglx@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3

Add compatible string for SpacemiT K3 APLIC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: No change.
v4: No change.
v3: No change.
v2: Add Conor's Acked-by.
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index bef00521d5da..0718071444d2 100644
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

