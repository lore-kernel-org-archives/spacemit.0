Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448327;
	b=n8UrZpo5DN6i1W6Q1bekKFjifqlswbJppfDCU7yR8gaX4WVKvi/gcBg1cxI/H0AJev/k
	 fhrc5/zG/Jf4CiFv5fPyknk6vTzsYaBZV++vBG2B0Pw7DYgkWiDH/GFLBykrMBCCAuBg1
	 dVL6805jNsygdvihQej+eCnvfFfWNQJs/WLW4zDXwJdGNfKmvQzH8Cqe5jYcDNLiAlwwb
	 gVmzj2tz+PU5HDHKR7+Lsqcl12mEa5NUrZLLI3bnkA6y/OaBfLL4uAEukn4a1dmeb6vDF
	 DEPD1W5+X2GdA1NHV4uphqwOpiWYMwiCu2skU3/bKmw+VVkLANY3E7QyeZOUA/Lbedg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GbUxlU2+BMbm8RpR8jkfpxDIh7mK30z7i6lZAljhk+w=;
	b=QeHsaGZFMwYaS39eQHQoKlI7uzZsIQ0vRjwIVNLfL7gY3no87/NdYJeGj+f1iy6mPh9p
	 j1A2evE/rJ7VaFsbmJQ7tatcI2Xdc6/nfi8gRb7X0nXtSdqnXSwEPlDLlp7V9AiqYQq2W
	 0IbIghikQVAY6lq3p1Q58p/nE4dq56UrUxzeGLu8DIJyPnc5p6Bkwlbg7IbrRoXhe7eMb
	 8pEMLcp1D+BRoZuLoVelLNY5DqZRy8HvbOl84Y2ocq5sQC6k02DWQus+/0vfppFdy28xb
	 TH8wt4fArpGwMqFSfAGsYGQnhNcd3V0icDjizQjJ/YVpHUVeSatpjy+fXJgA0ZTPEMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vECjYWfW;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F302606A323
	for <spacemit@lists.linux.dev>; Thu, 12 Nov 2026 01:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F302606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vECjYWfW
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-533797e72e8so23789131cf.2
        for <spacemit@lists.linux.dev>; Wed, 11 Nov 2026 17:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794448325; x=1795053125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbUxlU2+BMbm8RpR8jkfpxDIh7mK30z7i6lZAljhk+w=;
        b=vECjYWfWpnMjJJLoM+65yF4OBL3CcWsDiZKrI087Gx/HUi1sjTZnJJXkzIRxG8YEuB
         3F90qRHXhdNBvwM5yUwTWf8vM1eAoUG3YfN0ILtfzw3uudp9Mr0PAN2U22j/ssMlevzH
         9Zv1N87HUMCxVKDI9liIOzJs/lCJ92uu+G/ALM7SyJfR8SXgMbl9V+187pceKt1GmHoi
         Y0Z2oCgK/q1tQVt35ySFjWlhQryeKWc8eUM/WF8M/tQ0l2Zubznn0V2zeo1uDxJ1or7W
         FYVzMxvkBxPFCdaBgLIysUkdhqtBcP/fetXU5k50ZqMWGwACNsVcdNqUN5gkOPgVOoS+
         h68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448325; x=1795053125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbUxlU2+BMbm8RpR8jkfpxDIh7mK30z7i6lZAljhk+w=;
        b=HWFCoVyDowNGDffvGEiNec+7meZDZqGNEoQPG+xXuRpWhKkASepOAq7bXxUkGCd+g9
         p1TSj4dSt35uJBwzHMRX5hinu8ZL1pwMj0IcWpNTuHTy14DEqeLTjQSd8cKes5s5UOH+
         yovIWrxMndDqZ9LxgtgA0jVx20c5AF7g2DAiR+wqCmSHoDygou0qtxFhw4smoWrz3xjF
         Hb8f+qqWvYPYNT7OnDYc8KlAW0kBgwFjz5GBNX1tmRIhFBKDcDDIMo6UkLKs9hRgv8xI
         ZclMHcfCS0KzUIu5BRlhgmVcl3aBLRsT/aj0Tu1mTSKXNQUhRdTQL7ulG2kpoClvnOgi
         ZrEQ==
X-Forwarded-Encrypted: i=1; AL+hErFgESYyrXrKiT/Ey5nu/jm3DU5cmnxkHQXg6tzAk2ObYQ0LHJqHkW157ZjMnmCnEFqNllHLUVgqIA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8xZ4Oo/vYoQGBypzP0vhGSUSJdVPfX8k2Fp1lKbIi8LB1DE2IY
	qr9f2KOr+OkmKsSsq4gdNrTJ5rxKjEVqz17f9N/DmZXbV8fQkE291JIq6szkLzmezbYG
X-Gm-Gg: AYBFou1f7fDrFeXq2+RhbYwQJ0JBJKygPIoMJVFGow6UdQXbA5CSR5Wi20FEMzBS/EJ
	DN1DgW8TxiHUMGqzRRpqq285V42IbQShqGD7FVL6RfPsfb2PD+YEPbzYktCbJAV8HopHyF8TNtL
	aFHUHiFiHosmwdj+rwRlgGjdlaJSeM+HFkkwJ07365VGnHf3trIHzCX0LB+bozruvJBNwiJ2+Qd
	6S+vzQc4fzziaJDMsBsrF6edbFpbUDTSmkyBY82DGT1LIX+/n1N9GT6/TF3MB89myyQqBiky4Q/
	8+IRF8DKb0BnrZQY5bxazUO5PvF5/H3xFgiQUUNVN99oFrfDtNKi6t2xHJwtHQWMHZxdkZtCPXh
	vOZ6gIDPmUxIE8n/u8rBLCTxXdpjMRRXiZzS60fMZZZeYweC2XAR5jUMm6wGOcVI0ScUAG+8rRL
	nVvi5YfHzpFZclsCtNgeqTM12SHKP6t92XQ1RkXPgFWr7mu3RwLQg/ErRasCUAzGZrerg3+l/Wt
	OxxLpoEFz135Gjohoit1d1YaDqVEvvfX70Mtm6yoctKjmz6ry2arkrm9mtKbgw+UNnAdfJlSzvq
	lSEXmwdeJ+PdoUpFrpI8hTaUZcE9
X-Received: by 2002:a05:622a:5917:b0:536:98a5:cd8c with SMTP id d75a77b69052e-556c06e37c4mr54334061cf.30.1794448325483;
        Wed, 11 Nov 2026 17:52:05 -0800 (PST)
Received: from Ixchel.lan ([70.49.63.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f0ffc6f60sm16052726d6.14.2026.11.11.17.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:52:05 -0800 (PST)
From: Vlad Banea <montrealtango@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: troy.mitchell@linux.spacemit.com,
	wangruikang@iscas.ac.cn,
	guodong.xu@oss.qualcomm.com,
	jyc0019@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] riscv: dts: spacemit: k1: give each PCIe port its own DMA window
Date: Wed, 11 Nov 2026 20:51:47 -0500
Message-ID: <20261112015148.3911178-1-montrealtango@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The dma-ranges of the shared pcie-bus skip bus addresses
0x8000_0000-0xb7ff_ffff, the union of the three ports' outbound memory
windows. CPU addresses 0x1_0000_0000-0x1_37ff_ffff are therefore
unreachable from all three ports.

SpacemiT's vendor device tree gives each port its own map that skips
only that port's window (dram_range2/6/7). Do the same here. On boards
with more than 4 GB of RAM, each port can then reach another 512-640 MB
without SWIOTLB bouncing.

Signed-off-by: Vlad Banea <montrealtango@gmail.com>
---

Notes:
    RFC: the per-port maps come from SpacemiT's Bianbu kernel (linux-6.6,
    k1-bl-v2.2.y, arch/riscv/boot/dts/spacemit/k1-x.dtsi). They imply that a
    port's inbound DMA to another port's outbound window reaches memory. I
    have not verified that on hardware. Yixun, Encrow, can SpacemiT confirm
    that this is how the K1 routes inbound PCIe traffic?
    
    On an OrangePi R2S (8 GB, RTL8125B NICs on pcie1 and pcie2), up to 87
    SWIOTLB slots were in use under load with the shared bus, and none with
    this patch. Receive pages were kept below 4 GB in that test, so only
    transmit buffers could use the new ranges.

 arch/riscv/boot/dts/spacemit/k1.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..949843bb7789 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1152,13 +1152,14 @@ eth1: ethernet@cac81000 {
 			};
 		};
 
-		pcie-bus {
+		pcie0-bus {
 			compatible = "simple-bus";
 			ranges;
 			#address-cells = <2>;
 			#size-cells = <2>;
+			/* skips pcie0's own window, bus 0x8000_0000-0x8fff_ffff */
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
-				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
+				     <0x0 0x90000000 0x1 0x10000000 0x3 0x70000000>;
 
 			pcie0: pcie@ca000000 {
 				device_type = "pci";
@@ -1203,6 +1204,17 @@ pcie0_port: pcie@0 {
 					ranges;
 				};
 			};
+		};
+
+		pcie1-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			/* skips pcie1's own window, bus 0x9000_0000-0x9fff_ffff */
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x0 0x80000000 0x1 0x00000000 0x0 0x10000000>,
+				     <0x0 0xa0000000 0x1 0x20000000 0x3 0x60000000>;
 
 			pcie1: pcie@ca400000 {
 				device_type = "pci";
@@ -1247,6 +1259,17 @@ pcie1_port: pcie@0 {
 					ranges;
 				};
 			};
+		};
+
+		pcie2-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			/* skips pcie2's own window, bus 0xa000_0000-0xb7ff_ffff */
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x0 0x80000000 0x1 0x00000000 0x0 0x20000000>,
+				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
 
 			pcie2: pcie@ca800000 {
 				device_type = "pci";

base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.53.0

