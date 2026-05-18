Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E422379EF6
	for <spacemit@lists.linux.dev>; Mon, 18 May 2026 03:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779075365; cv=none; b=cO0iKIJr/V0FPFAnvmX3suMTKdqc9LnKWCN5o5bJ/ke0GCzSp7DWWHIcGkRAJGDjl1UW7HlXEtJl1jd5ypdIPX/XFXgh8BgVxSt3shnnoUXPqqH6gMdCjnhQNaI4wYU+vogG162U1UEUEzGUUSKz+4ap9KnYGIayvBtp8xEVxlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779075365; c=relaxed/simple;
	bh=YVMoIbOn6YecIFTQyAsU8tb/SRboDmmgHXX9RODPOg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=swpkxK86+3V83mTaGS0lIUIeBDVUAdyiHNT0qdIo/e4reY0dC6bU/V/7GPXuTpFU+cozdYUEoEgwrbPuaV/4LiwST46hTgqR0N74iXGY2KrwaOJtJ/luQEHpaCnzgR6jZt3KCk1zMbmZ/rbmtdBKqJ/RPiUm809cwd1eZt2pAag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=B6llGerd; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="B6llGerd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779075360;
	bh=Z+NDK3NBfapxA+/wLVSZ1OD25Ga6fXQEelZnMC4wbss=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=B6llGerdsDJtGas44sjQVlN3KR6MC3+wCZPFdqm5eax0NzmBzLT5SEgASk3Zg9cKO
	 IMuxzVvBkenb0a0+7b2W7+P8CX4q2sHmpyMcIs5i6M0kvaM/od1Gfq7UvVY3tJ1xfU
	 Ovhocqg3hIUtNXc3cMRpW6zeoLFFMOTBsNoUctak=
X-QQ-mid: esmtpgz12t1779075176t83c01d00
X-QQ-Originating-IP: VUNDhWnkeZJ77kznvS5xP4mwVwqnyDjI3vd5qUd1wPs=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 May 2026 11:32:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10048958506194084896
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 18 May 2026 11:32:42 +0800
Subject: [PATCH v6 2/4] dmaengine: mmp_pdma: refactor DRCMR access with
 helper function
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-k3-pdma-v6-2-67fdf319a8f8@linux.spacemit.com>
References: <20260518-k3-pdma-v6-0-67fdf319a8f8@linux.spacemit.com>
In-Reply-To: <20260518-k3-pdma-v6-0-67fdf319a8f8@linux.spacemit.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779075161; l=3268;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=w5fmms7zEKXi5LHvgSGTUoseJ2ZgoZsRCQwLD8J9bLo=;
 b=7+QAaP9dDheYiaDR3fXiR7ADYMKLJL7wXghp43IVvGMcX0gNsUQKHn3u51KGgIceC5QjFevsf
 b6pofBnEiHjAm5b86z9tWQBIwvLtRWCr5P4O7cE8X9EMlKCuyJzcnTh
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MQ7i6Ib+DYfjteHYMkjNJTm5ww+KSEWOGpLsY64+CSPIFrdgZL2YE9hQ
	lLpY7sieIuGKcrpyXX24iwVJA/Wx2RuT2J/TirZ1kWIeShMaTEoqDEC3rgIfm9mOeAugIEf
	cHPsbJzNdqG25XWAEKLmTlyJ2nhbgKr6Xbx+kjHqjWX8xjYyeHArY56BCGb8pjyhzmKUQX2
	hOKOU/23kZNeHzE1/yf8wJ/UM1/xeEi5h2EI/2l4VA3h4v7h0E/OgrtSqXT+L+rHEBAENEh
	YkGRnE3vr+QXrkBaAFefO89Pj7TKPBnDgri5RRjo3q8fpLtYJPY7ipLr82nMbOpWul8fpRL
	jElPezNqkHm3vqwWCJiahRZNUISTmToUXaoEqVfDJe5OBFeMMql6GXOL1JBNrfyNkAmyvc3
	Q1/aF8zl+5luLGMsbg2JXNC8gyhf4UnVBKqAnZNm/ULDLuAlob0jua/zSio3RJg1c2cBuMb
	/24/tVgd1UNEdPyL8hmWufWDMVH2irvcEQUUNINZBjmWwHoM4Ar0xQcXrf+wxkhOzmAZb+h
	7JEBnvi3I+A4NXQ5Q5qlXyUb3XFjOXRPia7ZSIPmfKcKhsBdAEtNBZl5sP/8uxzUSOMaeXX
	z3j+EVV3/U9Wie3GBsiw8qiABILgVTKm1h4e4keh0jX+kzJpIZht+W6V2a2hu3rOYDtS3+n
	pYi2J1A6SZs4OqjdeFsqwcFVAdUIzFDh1mYd3STZVvOEgfZYDc/Zzg/hIFQ7mY/+7ga3G7L
	r0ipqz8t335E5VO4woJTWA/IAxJ16IP4agjJmSmgoNYnLwXmTupesjMzTr+cQSbg/V8IEDW
	TQLjwbaJaTDpiqMwl2C4xZ3+X6eDvE7NAV45d+wOeYP1Z8A56yA9j2P9oVdPKonbmZmPKBN
	tNT/KU7/aUAa8OB4TQY4AZpLu0U/0FIcrZ5ynYvRn87c+dmco8Vct9NsOUtmdOnZIwO4hv6
	5u6fLQSP/fw13yfpq5woELTpKG9UMtWWwijQmXsZGzcZF612Ys2uPcmHxKEjsmCF8rn6YCv
	tGXRvI/ctUQu6Lsv7+9KBuk/wdb1lHbnfQ2nYIFLE3d3F3X+kCUz5dww/AXctuXUId3wcyb
	dC+ZvzfbcMHH/rMxJOebGhM7ozhLELhSwbnsYhHC9c7
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

From: Guodong Xu <guodong@riscstar.com>

Refactor the DRCMR macro into a helper function mmp_pdma_get_drcmr()
to support variable extended DRCMR base addresses across different PDMA
implementations, such as SpacemiT K3.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/dma/mmp_pdma.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index d12e729ee12c..6112369006ee 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -51,7 +51,9 @@
 #define DCSR_CMPST	BIT(10)	/* The Descriptor Compare Status */
 #define DCSR_EORINTR	BIT(9)	/* The end of Receive */
 
-#define DRCMR(n)	((((n) < 64) ? 0x0100 : 0x1100) + (((n) & 0x3f) << 2))
+#define DRCMR_BASE		0x0100
+#define DRCMR_EXT_BASE_DEFAULT	0x1100
+#define DRCMR_REQ_LIMIT		64
 #define DRCMR_MAPVLD	BIT(7)	/* Map Valid (read / write) */
 #define DRCMR_CHLNUM	0x1f	/* mask for Channel Number (read / write) */
 
@@ -154,6 +156,7 @@ struct mmp_pdma_phy {
  * @run_bits:   Control bits in DCSR register for channel start/stop
  * @dma_width:  DMA addressing width in bits (32 or 64). Determines the
  *              DMA mask capability of the controller hardware.
+ * @drcmr_ext_base: Base DRCMR address for extended requests
  */
 struct mmp_pdma_ops {
 	/* Hardware Register Operations */
@@ -174,6 +177,7 @@ struct mmp_pdma_ops {
 	/* Controller Configuration */
 	u32 run_bits;
 	u32 dma_width;
+	u32 drcmr_ext_base;
 };
 
 struct mmp_pdma_device {
@@ -195,6 +199,13 @@ struct mmp_pdma_device {
 #define to_mmp_pdma_dev(dmadev)					\
 	container_of(dmadev, struct mmp_pdma_device, device)
 
+static u32 mmp_pdma_get_drcmr(struct mmp_pdma_device *pdev, u32 drcmr)
+{
+	if (drcmr < DRCMR_REQ_LIMIT)
+		return DRCMR_BASE + (drcmr << 2);
+	return pdev->ops->drcmr_ext_base + ((drcmr - DRCMR_REQ_LIMIT) << 2);
+}
+
 /* For 32-bit PDMA */
 static void write_next_addr_32(struct mmp_pdma_phy *phy, dma_addr_t addr)
 {
@@ -301,7 +312,7 @@ static void enable_chan(struct mmp_pdma_phy *phy)
 
 	pdev = to_mmp_pdma_dev(phy->vchan->chan.device);
 
-	reg = DRCMR(phy->vchan->drcmr);
+	reg = mmp_pdma_get_drcmr(pdev, phy->vchan->drcmr);
 	writel(DRCMR_MAPVLD | phy->idx, phy->base + reg);
 
 	dalgn = readl(phy->base + DALGN);
@@ -437,7 +448,7 @@ static void mmp_pdma_free_phy(struct mmp_pdma_chan *pchan)
 		return;
 
 	/* clear the channel mapping in DRCMR */
-	reg = DRCMR(pchan->drcmr);
+	reg = mmp_pdma_get_drcmr(pdev, pchan->drcmr);
 	writel(0, pchan->phy->base + reg);
 
 	spin_lock_irqsave(&pdev->phy_lock, flags);
@@ -1179,6 +1190,7 @@ static const struct mmp_pdma_ops marvell_pdma_v1_ops = {
 	.get_desc_dst_addr = get_desc_dst_addr_32,
 	.run_bits = (DCSR_RUN),
 	.dma_width = 32,
+	.drcmr_ext_base = DRCMR_EXT_BASE_DEFAULT,
 };
 
 static const struct mmp_pdma_ops spacemit_k1_pdma_ops = {
@@ -1192,6 +1204,7 @@ static const struct mmp_pdma_ops spacemit_k1_pdma_ops = {
 	.get_desc_dst_addr = get_desc_dst_addr_64,
 	.run_bits = (DCSR_RUN | DCSR_LPAEEN),
 	.dma_width = 64,
+	.drcmr_ext_base = DRCMR_EXT_BASE_DEFAULT,
 };
 
 static const struct of_device_id mmp_pdma_dt_ids[] = {

-- 
2.54.0

