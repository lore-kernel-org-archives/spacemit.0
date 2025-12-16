Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4EC3BCC54
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892020; cv=none; b=n15PDF71hnchAb3weaE9TfpDBNTpbGg9FmWE5+3Iw1RvmXRlnOCPHENQty79Kp/kiaF0Je+Fyo6PaDo7vlPuALDlsFq42C+gUqAovZqTtGwo1XPLV8vuzybONmzy0vJdt7sfsqxgWi2+yeC4mj+2X5D/P5M8N57lPst7kMkq6fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892020; c=relaxed/simple;
	bh=SWtgk3actb41mMKlJF1tMZCCUTgeUvVgO8N077NFFiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BATKw4gRWyM5hUrQymTIZ+EVcyJVfTx/H7K8zjYyFchHdhacg+STdn55b9wQUVBxk7cu5rU941z+tJ5MBx4NONn8qIBljr0i1bK4RHVH5EL5RTDevwlEg+Rk59/Tvv+quxer52u+drpQAJsVEyoIFYCLtG3vm3302FTSTjoRfog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=jp4xiWEh; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="jp4xiWEh"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0c09bb78cso17123475ad.0
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 05:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765892018; x=1766496818; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUW1fhKJDbOe4HKSh/QeNnUAlu3BR5pVkgdl5b0ZaBI=;
        b=jp4xiWEhI0oFZtJhpqx16a9EJCc4UhNWNc42L2XrAJNKZ2/sUltyhkbTfYVP6D0lc6
         er57zw991yTc7lVmop0z87sGg4rkhUXb1m3ZJtuGDBKOIYV5SJgqBdawzdaKauPI3WqX
         K7fchFeeOrl1gVBEDb0jAv92cQnAwVqwJo0Wbv17jlHYHe8+akkSlsWuFMWY+u6LNCO4
         U8pve+62QjEXbrYsulngO9IsPokeEWvCZTo37A2eBm1V0NvEKdjH6FW/cMRZWSSN6ERg
         NGc+qInOFjI1iVbKCqrkOMDqOmkkGMv+Ue99ihdIZKAQm8xZT+gzpuNVpAEAjSxPR91B
         nk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892018; x=1766496818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HUW1fhKJDbOe4HKSh/QeNnUAlu3BR5pVkgdl5b0ZaBI=;
        b=Ny4H0cgfeF+75WCetrKEtHcBCS119HGhD7rWJjPI4sWuVDlHL0IASKBuCHe6PXZoeX
         OjKxEcjUZTimUAV9+Nde+Ysog16dB6meQJqbLDoadDATRXlNNSGYIX5zPYifv4RuFHDF
         ejlcqbF1dmJT5grZWWQB8f7rDOGqOjY0k8C6OcAmy8LV0PKqaHx2wtWdBRAIqw/d69Yr
         Ux4KRssrfMH6PQradQzek9DH38vI5B+wgK9qVrg5wgYFNdq+xemrCK6zjhmNv/kyBG+T
         Fsq6or5Ut/vR7HY2oQdvr/m5CMcVY+3GcDks6/FIayJ/KsFrhZ8zsMSkAm9qOOhrpXfI
         XbPg==
X-Forwarded-Encrypted: i=1; AJvYcCXvsx4JziyCYzN83Z7536f4Li0KllXxTR+F2n98K5PDYFcXSBjNlmmzNbvtEQ/2sK91xMthx5sqNw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgxhu7rIg9G3J7ugjIgutSAlVaIrPtHGmAhy/X6hX+bau82jZD
	2MX1jwTuAPb1imrnzxEBoSL0s+MV9Qm1pxJC0/zZ285eNeMq2s6BRoJMLtXdae48zYtyngjMPtf
	KY5dSByE=
X-Gm-Gg: AY/fxX7ArWIYna3EKmToKSYuV2IPK94i3UsHVhGhUhDKMa8qeZqre75WrIdxpYc4RwE
	sasXK4ol9C+3DKnAxbOBkWCyM0kIQ+GYoaaipC9wWay1HX532Fn8jaLuGiEfDXYRAnZcoj0pOxf
	+dIpvR0ElmacUpiqg4neFBd+TzJftXLzTXF3XYSV72WQuVXH6k/dczts7v1D2UfAGAPoP6u/7xz
	dKB3aLLJsw4d7OBTjLK672F0tI1yGrMA8ekov626p9deYmVm1YN2TC9jg0AuuDNIeRW3ITYBn68
	ns6gkZCP3CptIv+APxBL6KoH/PGClujKl+d5PtkX/nMqgBebdsVz4EfglfizvUVwGllwVhTlodC
	0Eu+T92e389qbqjFxpwzZ6yjT/+2fenfJguj3xcBau66k7RauSIgxthLGVJOJnoAD3EiZQrqe8G
	0on4rkHskOBthy7hFpmD2o7RwRVv9pcT4=
X-Google-Smtp-Source: AGHT+IET9GhiW4RGL3w1Cy73SGb3pcHepT5GGV/njIgZC7quLxJZByYdERwcXy6lYO6BkLM3PBzhsQ==
X-Received: by 2002:a17:902:e84c:b0:2a0:971b:151 with SMTP id d9443c01a7336-2a0971b059bmr130452205ad.2.1765892017756;
        Tue, 16 Dec 2025 05:33:37 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:33:37 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 21:32:28 +0800
Subject: [PATCH 4/8] dt-bindings: interrupt-controller: add SpacemiT K3
 IMSIC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-k3-basic-dt-v1-4-a0d256c9dc92@riscstar.com>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
In-Reply-To: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add compatible string for SpacemiT K3 IMSIC.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index c23b5c09fdb90baccece03708f4a381084b22049..152eff7335dd8457bf01d02497b7080f2a02ab65 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -47,6 +47,7 @@ properties:
   compatible:
     items:
       - enum:
+          - spacemit,k3-imsics
           - qemu,imsics
       - const: riscv,imsics
 

-- 
2.43.0

