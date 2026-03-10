Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AFE397E61
	for <spacemit@lists.linux.dev>; Tue, 10 Mar 2026 16:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773159555; cv=none; b=RGRqXh7aFYIQrJ0Hv9cKV2jEWuev/LiHhb+J6pfKTALczlgPiLdv9sWNOrlveSMR/sSpRZKavgeiJS6ilHCt3KBSGsDrds8VwKaAKcIKg5yy4E/PgrwEIBeHUe9RiCYSLi/idgzA7pMz68nojHG3Wbaqpy/dh2/1dkQQvfDHmgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773159555; c=relaxed/simple;
	bh=qYTgE//7RAeiJjbyR6YmrrnkI+Pfr/YpzrMs1chOhnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bs0SeXaK1uTT0PepO02BpjVQyGbhCJ7j7t67aVxxtp0MtXaEwccsUpdPlgEwCo7klI76l+BTT+NM5dh+hsgGTz012tYlbOxZ6qAOyM5o2Q3sXj1lLKCW+TPNyufooim1tXfBBErsfDL3wSy2mFl336Uamyb2nSVg3S1yidfl1LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [223.166.92.103])
	by APP-03 (Coremail) with SMTP id rQCowAB3lNtwRLBpMRBECg--.1611S2;
	Wed, 11 Mar 2026 00:18:57 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH v2 0/4] riscv: dts: spacemit: Add PMIC regulators usb pcie
Date: Wed, 11 Mar 2026 00:18:49 +0800
Message-ID: <20260310161853.3900605-1-gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3lNtwRLBpMRBECg--.1611S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKryDCr1rXF1UArWrWr4rXwb_yoWkWrX_uF
	1fGasakryDGFs2kFySq3WUtay8Cr4agFy3tF95Kr47tFy5uF1rG3W7JFy7Z3WrGryDAryD
	Wa17AFWfJ3W3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBwkCDGmwM1ktHAAAsC

This patch series enables the PMIC, voltage regulators, usb and pcie
for the OrangePi RV2 board.

Changes in v2:
- Merge patch 3/5 into 3
- Merge patch 4/6/7 into 4
  Remove regulator-always-on in pcie_vcc_3v3
  Remove pinctrl in combo_phy
  Add vpcie3v3-supply in pcie*_port
- Link to v1: https://lore.kernel.org/linux-riscv/cover.1769895215.git.gaohan@iscas.ac.cn/

Han Gao (4):
  riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
  riscv: dts: spacemit: Define fixed regulators for OrangePi RV2
  riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
  riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2

 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 233 ++++++++++++++++++
 1 file changed, 233 insertions(+)


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
prerequisite-patch-id: ef6e9c7b5854d0c08066b72f9a7868db8c2140eb
prerequisite-patch-id: cfe3800f8c791ec4c63e070af9628e88e0fc31b9
prerequisite-patch-id: b76493e625ae257c8adcd67874178458420e4d47
prerequisite-patch-id: 88e01dc92c83bd88ddeb78891d3088209fed8d6b
-- 
2.47.3

