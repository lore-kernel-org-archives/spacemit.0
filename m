Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369121;
	b=jEIDzm9CSuB0nklq1s0Yjgv0vzZ5dHWZJYwrbdmoxQan5Cg/0hGXRcyATjkXVg3vxhFr
	 /a6o+po/EWIZgjFfQP9rCKHRR+yiE1waKPkXFM6GDKE5v11zWwkhhWJ2tQl3JJXl3dytK
	 N7STHJ3HDjH7ZpGC1/ReWSUTf+4bLXZ4OwDCshwZR99sWLn2t+ox3LvpxxG+4M0QjegdQ
	 EqG+VzvDVBh2WqG5Xy2+7QRpEeRsmM5MRKmyAfj3c88UYde27fuWPlMMnCHJo2BF5LYyR
	 TcXxzm8gGzGy2a431AYdc3nk5t+fsI1tjonZ04QubMBywXalndFahg28XQE06k/23Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0I/gkzCqyaCNd3bzstkk5KNSlHR8/A+NpuninLCCHoY=;
	b=ytUseQjnrCzUh8kIzDFVCDqZPhBlmjwet3p3llVFZ3gwGwbp8wigrXKsm6IsT2HoddzB
	 dF5AFggAUrQRkfz3kIlMmtjtkSslFl7SniJhLKP8uCUSJcBtqEfm5SlyTKYC8rbOfUrOs
	 5rjsRQW6bEPIf2dR2116nYSqSxjLkwvm3zp/8iWjv9/I2hkAcAJt3bxeL5p8SbHkUYnaX
	 hz3svJLMKHx5wlW7taHCplxFn2WL0ynx18ML/KWI4eck+o2Wda0/3sdfBPm3v+wT199Rp
	 K3SfNomKgMBiPiIPGQai+gJuIrRwat5G4SaYsEDCyVxM8E/pwbKB2S0w6ssjd0eIgqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3ZbyWY5;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E200606A320
	for <spacemit@lists.linux.dev>; Sun, 22 Nov 2026 17:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E200606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3ZbyWY5
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3863db981d4so3273236eec.0
        for <spacemit@lists.linux.dev>; Sun, 22 Nov 2026 09:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369119; x=1795973919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0I/gkzCqyaCNd3bzstkk5KNSlHR8/A+NpuninLCCHoY=;
        b=R3ZbyWY5J9Oj1/4PjCbcQ8KZP15KyE26/OG7M/wHo1FQgLFHRna+lSqfIEnfw3abdU
         e4JXZwUXi6Guwyph/7Eh/HXaHE9EWAHQ4BWBj09jAVdHPBhaNtiA2XE+ZpqlaBxrkwdW
         QE9FaHaQugEerJVzB64Fha9J06osUZuHschK3WE7VrDiOfMu99FaHaS2Eqv8Dcdpj2vJ
         A0N89Hwab5aqrTOn6Nu8xypgcjpaPldEn/MiLwQ0udKqyeVN5jXOsv1K3YIN4xwuuTn1
         Mde9Z9vBmJzl9Z6D/GycX58jT6vfrlotmLdBrpGMYn5UwoauBjj+ERqPxUh6JRBW+Pz1
         RhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369119; x=1795973919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0I/gkzCqyaCNd3bzstkk5KNSlHR8/A+NpuninLCCHoY=;
        b=rx1tJtRWPAa8hLtyUGgv0pAX2fI7n38Xkb2ry0iGORyPbdA2bwhVL0/HYSLbTWZh55
         qjyABqcMu6Qtj/xHCOCsn8dwXC7GK45RdMA16/I2H2/Z/bNJo2zRpUW79tKCpgIUuppD
         FkzQ6H85WMfvnLRP0YGb4f7Kuc6b8Nc0EgtjeOsytSRVPub3CG1zjdezXEiQt1S7LrJP
         tvvmORNrLJASXknDV2YSX4Xalwl7MPE5KB79z0Kg1HYAGdftiByN5M3ByHIXxRchbsCr
         O0xNfNVgyCU2+SFFvpgRrHNvgotjdttP68PoRQO96LOdo8Ky+VQPBhOsHl4CciMLDONl
         rNBg==
X-Forwarded-Encrypted: i=1; AL+hErFW1y2Q/nNFU6JH0c85d8r2pt9PmZJj9s6jaFOIZ8pC7ipRkDqzzGLkvoD+/bSyqzKUUoxcscJiVw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/ati1MTgBREBi3Z31fvsxwjHrzt3DxrKMEyjzisz2byiFwOPAT
	0FHvtogtpkI0L4k7IJ2uXbnPTSryX3N3Xc9ET7RHBf+JbXXwTZHR3USK
X-Gm-Gg: AZFdTZdytswAIlSa8CKkbGXR3lGm00fZYTV6LpffsBEzsIYL6FO5C5H2QEIvKCx55IV
	S/C8VUxUBA05r2mRiCnz9XTunm3tqL8501opAzThwjAlr+sxp8lMRQsQV3VJ+9qxRpqU6707V9G
	+56CMsrWBvOoMCJvEcavJB0tVFedNbt+9cC1HgaeXT7jaecWg6otKa3pqCBdH8XGNJDRLRKQG+a
	8uB6yEXeLpzvIsn8EIOVbeNfgMkMOVl0CHD4EGk0qhDnj/jq8dMFNtFjyBIhtZgnJwEweXx0ewu
	ZNuf5r04OQS7/Kr+VzbRfvLmnMWhVGUFwWy5y7vFpu+oByVuOqZO0HD7C7SOXGsnzstz2lwPpPe
	l3uJM/pIKe3m6ZdU0Loe4xhHF1l5W9IfoW/24H7Ef/rIq0bstsKHv2SCygubYLrf9hDLsnkuAYW
	DdP4pumENPenrWL8+E+0rzN266TJrnyI1mo458ffF1vM6y6Xp9N76n6zJhlSCCYkUq4dtEp9HqZ
	pfTJ/ALUymkf4h/U0BfPgHJvCmTAsPis0KOw5NMqgaMXt3T2yofHyJlnRHeXk3zVi524NB2ot4p
	+Nn3zii1x/bCjRkK9bBQmdbX2Yr1FdwDvnRArWgbkJRFvWfmBQ==
X-Received: by 2002:a05:7300:430a:b0:379:7bb6:9c4b with SMTP id 5a478bee46e88-385717083eamr12238447eec.39.1795369119433;
        Sun, 22 Nov 2026 09:38:39 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29097985eec.12.2026.11.22.09.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:38:38 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v3 0/3] Add read-only SpacemiT K3 eFuse support
Date: Mon, 23 Nov 2026 01:38:07 +0800
Message-ID: <20261122173810.2409146-1-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds read-only NVMEM access to bank 0 and bank 7 of the
SpacemiT K3 eFuse controller. These banks contain temperature calibration
parameters and other configuration data.

Tested on a SpacemiT K3 COM260 Kit. Both banks returned the same data
across repeated reads and five unbind/rebind cycles. Reads from the other
banks returned zeros. With the separate K3 thermal series applied, all
seven temperature channels resumed reporting after each rebind.

Changes in v3:
- Use an exclusive, managed reset and assert it on detach or a subsequent
  probe failure.
- Use a 512-byte NVMEM space with bank 0 at 0x000 and bank 7 at 0x0e0;
  cover the other banks with keepouts.
- Update the binding and DT calibration cell offsets to 0x1c and 0xea.
- Clarify the shadow reload names and remove the incorrect reset comment.
- Drop Conor's Acked-by from the binding patch after changing the NVMEM
  address layout.

v2: https://lore.kernel.org/all/20261116075423.1519438-1-duge1256@gmail.com/

Changes in v2:
- Trigger a shadow reload before polling FUSE_READY; fail probe on timeout.
- Enable the clock only while accessing hardware and leave the shared
  reset deasserted on teardown.
- Explain why the root key and SSK registers are excluded.
- Use an aligned __le32 cache instead of put_unaligned_le32().
- Drop unnecessary Kconfig dependencies and the bootloader initialization
  requirement.
- Use devm_platform_ioremap_resource() and align the register definitions.
- Enable the eFuse node by default in k3.dtsi.
- Add Conor's Acked-by to the binding patch.

v1: https://lore.kernel.org/all/20261106060525.346873-1-duge1256@gmail.com/

Jiayu Du (3):
  dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
  nvmem: Add read-only SpacemiT K3 eFuse support
  riscv: dts: spacemit: Add K3 eFuse and temperature trim cells

 .../bindings/nvmem/spacemit,k3-efuse.yaml     |  63 ++++++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/spacemit/k3.dtsi          |  23 ++
 drivers/nvmem/Kconfig                         |  11 +
 drivers/nvmem/Makefile                        |   1 +
 drivers/nvmem/spacemit-k3-efuse.c             | 205 ++++++++++++++++++
 6 files changed, 309 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
 create mode 100644 drivers/nvmem/spacemit-k3-efuse.c


base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
-- 
2.43.0

