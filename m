Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537134;
	b=Ch7KovENsECy+UirNhCQUbLYmOaLCJv244dDgEC4DsSpEHInTRBOvGdTDMsM9iB4imtS
	 q+Yawt3F275j2RLNGJouxpbVDMnakYDOmy6UaeppQJmi+awCgleT3HWIPRrRdi3QWdkul
	 TId/s8BxQvk5ubkcs877bGV9JLV5dRUBDQkKrOTXnYFCTRksSbVykCkOUA8pA5KH3a6ef
	 qiAw9caAxm/2fpkwxGQTTa5lwxq2fFH/a4uVGmj+JhKMWCFLFvD+iFHa6PaKsqpLLSM/5
	 GTxetXDEWfWkxNBso3nGCbx1SmOjK+z85ifw30YJVPWUnYyysAPum6BjN3HmBKmZ3pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nMxjreD4y0QHP2JtQOEuC4CITCprzlNYUq02BXC432Y=;
	b=Fj4eprUp9dYtHfQLu84nBSXpZufGQAdnIomaH/g0Lp4i2jS/xowrENIIg/TY5/wHWgD5
	 7TMholb48f2KR8jCOJ2CMZ369eTONuA0L0+ilYhGlB0MFxR2bp4/2rDOXoVoWED/rbBvx
	 cp+fzwD5UAA7dqO4pgMwz+gaBhxYQjqTCp7WTrg2l5H0Pd0lRzyDvEAjubaqPw8w9QD8e
	 Qz/NyST9yP9HBRtVmBJSwU8hGhlu2o5w+BIMmFXMw4pIVurxihQuoA/sr2Yc0YTpWDGIe
	 MwweIJlehEGHgUewM+7FyOtF45QMuGp+mxanBredU5uD+14tg3MtrYcrT8lO2fJjo3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cq2Vvt1+;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C616606A32A
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 02:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C616606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cq2Vvt1+
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53512cd2f85so8355691cf.1
        for <spacemit@lists.linux.dev>; Thu, 12 Nov 2026 18:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537133; x=1795141933; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nMxjreD4y0QHP2JtQOEuC4CITCprzlNYUq02BXC432Y=;
        b=Cq2Vvt1+IoooFXEVlkDSpPGgzXdLRsJgiIF+YG32NVgvTEdihiUQXfsodz/dx/gVwk
         HOx0s9w4aM4Fch/e2acDUBssENij54cozFsKLBGslZYIoQt/cZFHlcFqQ9f/sUzNEDHO
         mIr0fIHHT3xnVBkb0c6MuiFEgRyCG2iv3A7EcKA6/8qcWgmtBRfJDdm4P2pfrtknYvqc
         lCg2dsFVYUqiYcUHzhFkRKeUtHKBQV4mLybvsiH6gReKQsYU8uXSkxgw0f9RjhJMFQCO
         aWHzT1VJhOihwWe84Kn8T66wUQqOsv5MknR5tVQBKB22+egvkXsdI6YN51wdIlMJ9xVm
         UbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537133; x=1795141933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMxjreD4y0QHP2JtQOEuC4CITCprzlNYUq02BXC432Y=;
        b=OcctncNzWGxFDyDdVBxU7+QaJCdFJSeG+3cAaWp9YfWGd5C0cgVKnMx84sn7/L6QUl
         Mdy8OIbcRraNqe7tPPs8SAAHGQtH2s5uehbJb6i2Le3lotjJmz3PPqeGSWDa/H4I48JM
         kibQ15S72Tzxb2TZJMPlpIyRcjdztXm+qINOOKiWWKJnsbwf5lDcNgjdXxQga5pRj0Oz
         QcpP5CtnCFjxw/7g1MP2a6rtBWN/10NLVIv9sSKnhPIAl0XAdPtirVcdnMjwpu+ZCWRB
         RENezfrT6EXMx7o5LqzbRF5jQzlkFo/DLS3KMeOlWP7JSlTT4H8jB5ofua3fuSCC06pF
         x7Eg==
X-Forwarded-Encrypted: i=1; AL+hErEzeb2R636hE44QDAHtBm+LefT1oHD+VgcRkgUeghg3fnX6EpnFXskA24QDAlY2HRlEAHINC3F10Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z+YqsN3O+m1vv5ameEhvfzhKUCyHrS207Rk6cRpGmLFQkCculRS
	SdjVu5egBaIXyNBvP9DmcjvntuvJCPbPYvJA29yYS8Ni59Pmb1lN2C0=
X-Gm-Gg: AYBFou0+sluvLrZ1WhRQGOppBG11QazdcSYBoD+arMNUKyEpvtigQbTclbbvRw2J54k
	s0dbMwDo3TbPaqUslAfSZkdVaDkLBTg1GtoSAewe3FBGdE1ucEMtEXsonyCyfSeYUzx1/sp1Hg+
	Qg3GL3QzpRymSAOtzg5IhBMqjAuIRfq/ivRsDMykMGVCXvsmm8EEn2oc3dhx06jF+AQHGaePtR7
	LEEBrUP7DoIOne555o4AHDm4fSI945DxHojRcLsKkDCEpBKZXdT258BM/x5PTJ7R8sN3rjoO2hs
	7xNDeiX9O8sg85teD0+tPqyqMtqFhDvNuZJR7Vs/HnnjxHg0jPSqVdtBTLaS+vtJqO0vqeS3HRz
	Ol73+hK9QR4UhHMlHsoAHBAi6oXttJ4/F+cTQI2QasWjGfn6nThv+DLzGTnI0j37/9pToJilv6s
	++MQoFpQ2wGzRiuKyaZ4OZBlWoOb+WR594KhAx4XtrO6g6BHg1qGVnoAoew7HqlPOClVxD9+l9A
	jLObstLjkfPRf3hiFn77l0umgW6aqRgLGdo2eIr/4p7U3RVPL53KYtA1y+rszMFOgueRTQ5MM12
	AA3mfsWjqpdx7wDxONlEXdJlRdu7
X-Received: by 2002:a05:622a:180b:b0:535:87c3:79e5 with SMTP id d75a77b69052e-55ac7568907mr20793741cf.39.1794537133164;
        Thu, 12 Nov 2026 18:32:13 -0800 (PST)
Received: from Ixchel.lan ([70.49.63.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dbf30dsm9688926d6.44.2026.11.12.18.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:32:12 -0800 (PST)
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
Subject: [PATCH v2] riscv: dts: spacemit: k1: give each PCIe port its own DMA window
Date: Thu, 12 Nov 2026 21:31:58 -0500
Message-ID: <20261113023158.2872492-1-montrealtango@gmail.com>
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

On K1 a PCIe master only sees DDR: bus addresses 0-2 GB map to CPU
0-2 GB and bus 2-16 GB to CPU 4-18 GB. A root port does not forward
upstream an inbound access that falls inside its own memory window, so
dma-ranges must skip each port's own outbound window; the other ports'
windows reach memory.

The shared pcie-bus skips all three windows, bus 0x8000_0000-0xb7ff_ffff,
which leaves CPU addresses 0x1_0000_0000-0x1_37ff_ffff unreachable from
every port. Give each port its own bus that skips only its own window.
On boards with more than 2 GB of RAM, each port can then reach another
512-640 MB without SWIOTLB bouncing.

Signed-off-by: Vlad Banea <montrealtango@gmail.com>
---

Notes:
    Changes in v2:
    - describe the K1 PCIe address map instead of citing the vendor DT (Troy)
    - "more than 2 GB" instead of 4 GB (Troy)
    - drop the RFC tag
    - RFC: https://lore.kernel.org/all/20261112015148.3911178-1-montrealtango@gmail.com/
    
    Tested on an OrangePi R2S (8 GB, RTL8125B on pcie1 and pcie2): SWIOTLB
    use under load went from up to 87 slots to none.

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

