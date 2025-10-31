Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C20D34D386
	for <spacemit@lists.linux.dev>; Fri, 31 Oct 2025 18:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761935375; cv=none; b=hi3ZV19WGbPJy/7752NkWURylSuMgnrUXIrZ7Lr6X57yhWcx1ccXHcJeevBWzuCwN0lMPUUm/SuJ0i6gl5zUh3AlWrjl1E1k6Gt7LpszifeQzHpDA7qxcWtWWpC30HGJgUDLWYvpTKdqxcjZvu3abvI+bmruKqzi1u5I/w3Dwh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761935375; c=relaxed/simple;
	bh=76TAbu9Zc1aJJiK4pWRwN4rAveXv9Al84+Dh7An/dJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=F8eRuxaGWmCf8Cg2zpuZI4yrNN2NH/pQTDyjr6QWCCgLNy6aSwplUKogAty1hmLac/+Hpbm4LKueRNN3yeYBIzTRNjZ2uCks2bzAWKNH1sIQqhTOeqB1K/Ep/1c8IyvoVkSj5tF/55rL/IDmrr/1Xh/eVB+d6ts0OkLRbxjR9e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.0.2] (unknown [114.241.85.109])
	by APP-05 (Coremail) with SMTP id zQCowADnU_Lg_wRp2u3JAA--.5659S2;
	Sat, 01 Nov 2025 02:28:48 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Sat, 01 Nov 2025 02:28:04 +0800
Subject: [PATCH net v2] net: spacemit: Check IFF_UP in
 emac_set_pauseparam()
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-k1-ethernet-remove-fc-v2-1-014ac3bc280e@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIALP/BGkC/4VOSw7CIBC9SjNrpyk0RezKe5iaIJ1aYloUkGga7
 i5B92ZWb953A0/OkIe+2sBRNN7YNQO+q0DPar0SmjFj4A3vWNMyvDGkMJNbKaCjxUbCSaPk0yj
 2o5QHJSB7744m8yq5J8hSGL5PR49n7gg/5qI8obbLYkJfRVEziU6z85aKfjY+WPcu2yIrhj8zI
 sN8itqJjaJrpD4ar5Wvla71CkNK6QOcZYIg8QAAAA==
X-Change-ID: 20251031-k1-ethernet-remove-fc-82fd67d889a6
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Yixun Lan <dlan@gentoo.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CM-TRANSID:zQCowADnU_Lg_wRp2u3JAA--.5659S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1fArWkAryxAF4xtF18Xwb_yoW8Gw4rpF
	WUZasruw47JF45KFs7Aa1xZFy5JayxtryUuF1ayw4rZasFyw4UAF9YkFW3Cr1UZFWrCrya
	gw45Z3WfCF1DArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
	W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

Currently, emac_set_pauseparam() will oops if userspace calls it while
the interface is not up, because phydev is NULL, but it is still
accessed in emac_set_fc() and emac_set_fc_autoneg().

Check for IFF_UP in emac_set_pauseparam() before proceeding.

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
Changes in v2:
- Reduced patch to only contain checking IFF_UP to avoid the oops. More
  invasive changes will be sent to net-next in the future. (Andrew)
- Link to v1: https://lore.kernel.org/r/20251031-k1-ethernet-remove-fc-v1-1-1ae3f1d6508c@iscas.ac.cn
---
 drivers/net/ethernet/spacemit/k1_emac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index e1c5faff3b71..a3fc17d2ca10 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -1441,6 +1441,9 @@ static int emac_set_pauseparam(struct net_device *dev,
 	struct emac_priv *priv = netdev_priv(dev);
 	u8 fc = 0;
 
+	if (!(dev->flags & IFF_UP))
+		return -ENETDOWN;
+
 	priv->flow_control_autoneg = pause->autoneg;
 
 	if (pause->autoneg) {

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251031-k1-ethernet-remove-fc-82fd67d889a6

Best regards,
-- 
Vivian "dramforever" Wang

