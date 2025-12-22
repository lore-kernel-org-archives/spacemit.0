Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B12A2D73B8
	for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 13:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408786; cv=none; b=r56dqZ9sBfhNoQS04AIjqqqfkuHUFS0kzmdc+kzS9RbhLd8+LI7kvRO6sipMccubUbGwGNl7gYo8wVPIfmR0+vov2BTz/ue9bBYZfYTOY+F5lTo/pdaYaKOcZDCDdBzVSn63SYzBu+Q3JXL9xhkM59cXLApJtqwhK4rQKrATUWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408786; c=relaxed/simple;
	bh=Rv8zqZlVb4ysvH1kGjBn1SvVInEk6LPP485yK/BDHLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lTaiyqsqKmO5XJgPkW2ZAiHE76r104h/UbLy6dI70XaS8Jj1UM0QtrUweZ4pw7pzapHFnK/TeA5hPsRG0tF134pXJpxT0OBEoPSBIUjb9hUkMg7D4W2dezxiRethw4OGutdFWJYjxt6NAxRKMa6Fwx+vp39zIud9bOak5rMTbLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=n5ZTxBYT; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="n5ZTxBYT"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so3050138b3a.0
        for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 05:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408784; x=1767013584; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXhlYUOgp3ayhnB6iDyUlWrJZ3/fHlXGidOq3n++KU0=;
        b=n5ZTxBYTpgx3ruOkmtgC5L7Dala0+aIJl9imX5oCnkMtI+KK1b/0yrtC/0iATZFyDj
         /Lh/JMkbDTzDnc3+XsNwy/x5WIZM0iWnZXsMRVLckAoOda0pt33KfHZNvIP6zmaQ7mKQ
         usAQqTQxtn4ZLI1gjrzvSZ4eOUa/jxBtE5RQRBf2b7jXIvrBDwCZg4qxccfhj9R4W45y
         iWDOQURsSBanKmOj8GPH1UV4LztskEpEBlzGUuLD2rffFUJw9V0hsTA3T4vVacZKdkI4
         wb7R6RIRb+2GJKQ0iwcRb8khKjhJggZv8dvfgbSwJYcxKRKdTQ/oMVGllDv4AKOf0AU+
         hIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408784; x=1767013584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JXhlYUOgp3ayhnB6iDyUlWrJZ3/fHlXGidOq3n++KU0=;
        b=u1FxberTlXUrayya11WA0Db8RxtvMsFNC8/6skwhYY2trS6cn8b4wMPIgU7LK4vC1p
         lDzkg5whtvhc3oJkakveEgutoKlbRnwoydxGMO2MICG3VCwyfLIOnPy5q5pLLtyLVw+t
         blDIlcxnPs7wRLqhqxJQNIuCJjVJ/BzBcx3QL6facEHZVPQ2TG97ddB4TtfND/eJcI/G
         QZ3bWGmGjVegytzoTyaDiv4MyihYXPsbP9pywMfexDI00xuaAw12ull9ITpSc9KwgDP7
         Xi4i1k+DK4VpuElT/gDNtVBzDzXT/CkFU+U53+6Il0OU03+7Pj/+TpvtZej4zPhZEq7I
         SSpw==
X-Forwarded-Encrypted: i=1; AJvYcCU4mlea2jlovSXK5yEenDCCp41fH5EsXj+chOqvovSAxkDa70MIgSRhnh9Eq+X1pW63/rBAZEatmw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt69YcF4hoyh0BVglItHkAsqZTKLLi93Ztjy3eTIC8YHyxcH8h
	kaWyEn8C58Ns0dE87Rrd5e7yjCJJnk6QHTEjNKwDA2SOhwkKMkOI5BTvl2nCrb9n8Fo=
X-Gm-Gg: AY/fxX4QoB4mHnPyedAtD67AW9Jk0aA5LlMXTEIgTv49InowGQG2rhwKcrrEsCSpCp0
	AMdrZOpPFGrp28wcqMiKO1g0w5Ar1M3VR3X05Hn2/h+PMkZd6CYZtzZR8cRmLSFssc1KhpeIM9u
	9/cqngtRtM0M764ZNGhcZBeYwN2R7md86KJZYIpJEWJ6w5Bf7LI3vgWXu1U6kgZxmS1URYBuG+g
	Wm+a8Gm2cdT6baklW3mY/b2wkd4pE1Ly4/zFmeTG9MRZVYBZ8jxCCxn4Gh5dZ7ke+1fww4bJaNo
	q8tILFOKL/PSopIFy9MA8a+revEnocyNOL7M8iIdY8GcoXuVif/2DTXggoL+6ClrxQVvFGXT5Th
	RnfxzyvfBS5JcffRyFodcdfTPnIIWHmmC1YMFtPAs896/8Excde+0/Ziol6QsZG3QEAYefVR2h0
	4NVkVGv4LEk95bA3q7anM+yaeL2w2bVXg=
X-Google-Smtp-Source: AGHT+IEMBF+3e0D/+sI/PT1plC6W+n/irFioveOjohAD5bO+6V93DVk5UOwucVi7eXYOS/loRQ/JUw==
X-Received: by 2002:a05:6a20:7285:b0:352:3695:fa64 with SMTP id adf61e73a8af0-376a94bf23emr11214001637.37.1766408783610;
        Mon, 22 Dec 2025 05:06:23 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:06:23 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:11 +0800
Subject: [PATCH v2 01/13] dt-bindings: riscv: add SpacemiT X100 CPU
 compatible
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-k3-basic-dt-v2-1-3af3f3cd0f8a@riscstar.com>
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
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
X-Mailer: b4 0.14.2

Add compatible string for the SpacemiT X100 core. [1]

The X100 is a 64-bit RVA23-compliant RISC-V core from SpacemiT. X100
supports the RISC-V vector and hypervisor extensions and all mandatory
extersions as required by the RVA23U64 and RVA23S64 profiles, per the
definition in 'RVA23 Profile, Version 1.0'. [2]

From a microarchieture viewpoint, the X100 features a 4-issue
out-of-order pipeline.

X100 is used in SpacemiT K3 SoC.

Link: https://www.spacemit.com/en/spacemit-x100-core/ [1]
Link: https://docs.riscv.org/reference/profiles/rva23/_attachments/rva23-profile.pdf [2]
Reviewed-by: Yixun Lan <dlan@gentoo.org>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Fixed alphanumeric sorting of compatible strings, put x100 before x60,
     as per Krzysztof's feedback.
    Added reviewed-by from Yixun and Heinrich.
    Updated the commit message to provide more information about X100.
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d733c0bd534fb63ed7c0eada97c42832431f1fc1..5feeb2203050ae1f1404100ab7ba93e224f72d97 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -61,6 +61,7 @@ properties:
               - sifive,u7
               - sifive,u74
               - sifive,u74-mc
+              - spacemit,x100
               - spacemit,x60
               - thead,c906
               - thead,c908

-- 
2.43.0

