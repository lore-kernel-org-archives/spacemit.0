Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213671E0DE8
	for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 06:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459968; cv=none; b=nMywdWUe/z1D/9PB/p3zOiKQPmCYNrqC2E+QpBkufVrYiqpQN8ml0T5pMF3KQpSqfgHWagls0E16M0MXmuGEw8XXIyckrUJfLW+Y392xkP2An1vrCNN5AzxQ/IR9vok7UPLaBvoQ5rNaNQexSmpVLt8AFhi1oV4VeRr9qIEAyYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459968; c=relaxed/simple;
	bh=7GsKL/0cK9MpJKy0wiy9gpBRnMF//wYNkY0xTML1hsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MkH+qRXVnEqfD7WznUQdJDqSbauDv2sgl4F3FD3sIHpLEsr+7b76bOCSCZtF0PQiNvlITK3VPmH7t+ijIgIuIn5Zae7MyDPuKNWN4e4j80lrPCqkxhehtUGC/l4uQ3dQlhKPTFF4SgfwV93UwA5wOhvRT39PGug+bsFkxQDroFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=W0n14WFn; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="W0n14WFn"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so4207315ad.3
        for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 22:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768459963; x=1769064763; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBO7qrwPmz8yCkOE9w4XOKMChGOOJNh4q0wHZ0CHZEQ=;
        b=W0n14WFnKpvSPT5See9pt8hAtROdJVjmlHFBCvZGiAkqvLJn9zcOoqR23g+BU7Ty+q
         i4iExBLxcYzjbcT+xvOrmuUSXgZ632rgjEibt5JEn0Fr5geC39u4hswWwIULfMmfLDrE
         EXBCyszxrcq9UMdwhw+TqOvPl0WtyL/mLAuEWu7NU1vSnMVfL9GcwUcUKfiguiN0/GWi
         7a5myTByv94paMi5ZE6+B8D255xaCOGPpQevZORQ9CFC8HwxFXGo9Y1C67wBP4i0K17G
         ipG1ivhI9jCvZYSNG1NaKaOwNSwNuxI2CKt5VLGQfpksrHhdPR+tRY/yyeZH1/td8rMX
         FkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459963; x=1769064763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nBO7qrwPmz8yCkOE9w4XOKMChGOOJNh4q0wHZ0CHZEQ=;
        b=f6YYljVFLXTymUs0uuuYjqDHGFEuoWeMGxPR/tgIbRWYmBvFtDzDdK4glPUCA2HNtO
         z/lKDyQGedlWhXzEkuYytRvUC4d0vEXxK6Ag1GJHQ9TQUMVtGdS1VQg/s9KLZBWppOhm
         G0GCpZY14GI8D62jfd3bYQoORlEwZkQ27TOw6mnaprTzfnZgz3xx5dnoDnVBug9V2UEr
         J9daMR0Y/6zuHkl7OleCRAOj2VZtKhEmW0T2ljoA+UqE9dr7lTKgtYu7OAPaibjxOF+Q
         wd0yhv9wMGA5FdHmgj9l1EuALTocvfOZVZPGQXQt+SXV8LRcbaCYdTM1gmWXJt/FsYnO
         BiDA==
X-Forwarded-Encrypted: i=1; AJvYcCXVFy27CKMae5LVWTreyIBTB+rCIMzICFHWZBwe6lbxFmURxHXtXvYdmzlZqtZJODhv/nKEU9gDVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRSZV78BbLwKZ6iu5+S0Oq7Dk8oWT3Yj2FanlUi6ithK1Q78J3
	d4XvS+Yw0Y9Qlj3Q8Ehb0p96epjU4XWON7rdUzH+6SQwwajIEfNNU34RZuxWNIJ32Rg=
X-Gm-Gg: AY/fxX4b3bHa08z/otpTso7/tU3PJtCdGPpXmbpYyIUfZgzTKmUnKRp6DmsC/FYN3cO
	nS5ptyxV4D2gWwnFbUZZy1l9PRDj08vJWf29BMUTtJ+As2bVFfcdQNrf/HsQtPoLgGJBULinGYv
	gTO8cyU+0olHhfXcNe2YmLNL/y44ZguixUVZ+lUEU03YFVKuJtAbvkoJrnGQNJc2Cfd5shHyX8a
	XDN60wUx7O9btkk85QER/b8QafXMVOCOk/LSn94RocMSpYbbWJt5qGrvRQ9BJb/9JPKTHVp8S//
	UeU7XB2ul7MeqZ3eidOQMXZleHzUDCH3b00mAKQdliwiV7NjDjexirPeqYEQ1k3Ne0sNc+QTOat
	YSJd+NUyMUYjNtfceh3lV2sCUC6vR0seJDYE5v8MWOa2URcF98ZElHy4N+SFnVH+pjm+1u7z1VM
	k8uzQr+9UsDhrut/9itb7M2vLd6+4XZz4vIgZMpyt7EJzbz92hMJgiMZQHxEJ3jIkJ
X-Received: by 2002:a17:902:cf04:b0:2a0:dd66:d813 with SMTP id d9443c01a7336-2a599e5f8bamr55517385ad.55.1768459963033;
        Wed, 14 Jan 2026 22:52:43 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e7a3c6fdsm235081015ad.15.2026.01.14.22.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:52:42 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 14:51:43 +0800
Subject: [PATCH v5 4/7] dt-bindings: interrupt-controller: add SpacemiT K3
 IMSIC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-k3-basic-dt-v5-4-6990ac9f4308@riscstar.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Add compatible string for SpacemiT K3 IMSIC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: No change.
v4: No change.
v3: Add Acked-by from Krzysztof.
v2: Fix the order to keep things alphabetically.
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index c23b5c09fdb9..feec122bddde 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -48,6 +48,7 @@ properties:
     items:
       - enum:
           - qemu,imsics
+          - spacemit,k3-imsics
       - const: riscv,imsics
 
   reg:

-- 
2.43.0

