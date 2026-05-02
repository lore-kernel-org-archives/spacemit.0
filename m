Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5296A322522
	for <spacemit@lists.linux.dev>; Sat,  2 May 2026 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777716832; cv=none; b=uGwCp64XJXmF1NgQ/X2oEVi+PwEmvkG3wo11U9YiI9z3GyfXJ7ZtGYPNegdwOOiSvW+pp5TBGWwQt3go2P9R5xjYDUv7MHEai5qr4j3fqCDmo6Q/1s9x5oio3+aTakDgQZZVQ3qW/pzAD3XXdDjkOg0mtuX8sB3m178T/S/A2ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777716832; c=relaxed/simple;
	bh=Qeyor5pnGeEUxHDLnSAUNrklZACkQd3iPe/8N51JgLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p482qd3h64hMdRtTmRTpKPiRRm8l+NXPEwUOA612jdO6LrLhWiuNiUB55i2QdWlu5kbxH5FAfrAil9ASMCs1A2Kha4/kzhlc/o3nz0I4hLQOdCRDA58vGDLAz+Has4w7HGvOBi0B4FvBa6GCMMON/lYj+tf7UdNcBXFuxbO9JWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pn0deuU4; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pn0deuU4"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-362bb3260f1so1880980a91.2
        for <spacemit@lists.linux.dev>; Sat, 02 May 2026 03:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777716829; x=1778321629; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xxbrEotld4A1INaWDXAQzVmz+vSmMssLxNlmQzLKGY=;
        b=Pn0deuU4r4TLxqnL4x/GPgyUIogYFbNZGm8GRWWwTRx/wfD3Jx+REhSOLwUTMye773
         GHyM5wKMAhxmMgVZTHD86Jt0djygisw/ePElWtF2VZHFk7/VtonOO+ZtQhOiyh+nbFcf
         x5zT7OevOD7T+vQPmt2E9IJ0m3R3aXu4Q4pu/qto5kbvdQz91622ukyRESpidNQZraO1
         Y5zDqgGPlcu2k3qxFK7qshZ3dWHQqt2FhaawcVhUk8RH2dNWU6X4+1NXyWNN8CLx9B1Z
         LgzE/Fgqf4TOhTbH5RuQGR5obYixxp/IBNM7qgLJtLeTHEfn//1ds70atWbxj8FQ+KFQ
         BrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777716829; x=1778321629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/xxbrEotld4A1INaWDXAQzVmz+vSmMssLxNlmQzLKGY=;
        b=fQOgAvmLRRfaDDcQILU5XZlp7iMg5gXASl9IDInG0Nv0ScRmk3KyrKIewwEDoTtOdT
         kQoTyOK8CgYLMcoKOg7aneylIomCCSMUplNPbPNqMN+B7+ByXwt7eixsvFU0cQYLH135
         JbjhZaEY+6UTNIsKDH3nx3WpMkN9y4ntM9eLapG3ca6blfVxCIzW5Mz8dCg8ue8pYXm7
         yCaZqSG5NeNxvamdlRmVclmMWRPB+N+ez0XaOsi52dAkpLS5O8AD/U3G+UE2ayPt4Uxp
         TxMPoPwSpWlkZ21p3eR2roDNBOQJY4vFIel85rm0QhYRAmitKJCvCX6AeHq1ILvCpqsx
         3U6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8kEILrNdEEaq19gao7EGsMrg5GWQ4S8vXPSJtWjf9/XhL53DLGJ1f9n35aN3pladyrY/it4XOhLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqRCWQ3oA4LjUrB0tmZB3zD3OfE4tPQvXsk7p9PzUnoavzyas6
	lhG9Qq6rRNV3Hn0cIOKoEk58EdsYS+B6LzUV4M6cwSh0VgGU+CVDh0dU
X-Gm-Gg: AeBDietjtvOB2tKmRL7CWHeZK77F8s0Zjaf9u0M/eEApsEoBFjlvHovFFFjPPZD7hHe
	v4/utbzNaSGb7AY3pGI63ieDVPJIzkHkK2uZCdm7M+DQCOUNmHD34MrHw16AheifPlVQ/iuT6rj
	lRtF07Bdx1zIqhy2t3VWRSBCSYpCl03qjHO9jf/Lfl3wr3Rm+IOxjDUtKNklMM2ONc7XPe+BVNx
	g6Zbbi0bWaLN2z+aGvCARfjK+a3Q6/bKAIGV3I6w7fplnlWCbJQKQyTYzPp14YrnsmsA1dzyqLr
	+HEUHjafMJdRtuQLaHtD3bKFSgNwgOLCNf2ScSnJ3m/ChJheIlhVjYkY4qhoP/wE51HH7Ecn6Cs
	1pSKhhPgMiTj9ybGz5Yit/+6QKB5sCHSxwoPTtsM5pk6rzK4XGhVZUgmrwy3dz8FgGiV0aN//0b
	mom34YRJ7uc9sK+npxY4FsEn98X6/mRUoGhtb7xOjq2LUx
X-Received: by 2002:a17:902:d20c:b0:2b9:ce81:fd75 with SMTP id d9443c01a7336-2b9f25674cemr17239855ad.11.1777716829028;
        Sat, 02 May 2026 03:13:49 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae6d123sm50453575ad.84.2026.05.02.03.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 03:13:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/5] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for msi handle check
Date: Sat,  2 May 2026 18:13:16 +0800
Message-ID: <20260502101319.2364052-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502101319.2364052-1-inochiama@gmail.com>
References: <20260502101319.2364052-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMSIC device on RISC-V based system does not require ID
remapping for MSI. So this device only needs "msi-parent"
property for IMSIC-based SoC, and the "msi-map" is not a
necessary property.

Add new condition for msi handling on IMSIC based SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
index b3216141881c..6a595207fae1 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
@@ -27,8 +27,11 @@ allOf:
   - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
   - if:
       not:
-        required:
-          - msi-map
+        oneOf:
+          - required:
+              - msi-map
+          - required:
+              - msi-parent
     then:
       properties:
         interrupt-names:
-- 
2.54.0

