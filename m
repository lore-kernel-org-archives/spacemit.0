Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.124.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B99013C3CD
	for <spacemit@lists.linux.dev>; Fri, 10 Oct 2025 01:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.124.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760061513; cv=none; b=Oo8DpAHJAK1YOUWylTbJlBJwyZrAzwREkK1bm+pNn7I0p2XhxIdAlHgUY1i0NcYq165Z2becG7a/UDkzPVYDcgIm7xa5isHZAnVjXUV9BwMYRGvscR4dQ5H2Ut1fVj76K/hcp4aO3yNWlLtguX+fOKBTQwKfSqClE4kyY2lzVAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760061513; c=relaxed/simple;
	bh=U7VjtgukKmMhZ4cuasC3YXbNoOHhy+YexBytY8tYuCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZ3fEcgiwPVFeec1zVIwgqE3mHb/6h81pJ/Pd0bjWfLD4tNRhYHfq8fVjru8BbxfBYHLFW5/QIbdzHDjkEcgYNhlWnckuhwtgCoG0gG2DG2lNH5Qh8MGgxce850yUAONzVe3rSZmPx51+SFipyzgGjxHrl/6TpzglAZOVDfJbRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=LRsS2opm; arc=none smtp.client-ip=114.132.124.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="LRsS2opm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760061425;
	bh=D/ZVGW0hNqbZhxwdszE7Ij2oSHzZLYG5bnLOtSUUxeM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=LRsS2opmv0c+gtGQftnU56oM/V0McgaB8WajV99gM3WF6UnhS0XzYTxWBHBVFaQZg
	 D9TUvClYszLoEisFFTqoE6EqpZmeKvxbDoK7ClYdReMZBA5YQSaDfSWNYZE1U8FQhO
	 YFqDfdq1Fag022/+RBz9qdvGXCvxqXdfU0BtTjZw=
X-QQ-mid: zesmtpgz3t1760061416t43febd1a
X-QQ-Originating-IP: 9769BgJ/clbn0uKZisrylxEVb6PrybtCFGhIQmMwEq8=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 10 Oct 2025 09:56:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14237210305398404918
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 10 Oct 2025 09:56:33 +0800
Subject: [PATCH v2 4/5] riscv: dts: spacemit: enable eMMC on MusePi Pro
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-k1-musepi-pro-dts-v2-4-6e1b491f6f3e@linux.spacemit.com>
References: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
In-Reply-To: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760061399; l=799;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=U7VjtgukKmMhZ4cuasC3YXbNoOHhy+YexBytY8tYuCw=;
 b=UPp7YQsoKKFT1kvwameZDI1dky5TTwfUNCaH8fSP+rO1EntP0eXTJTH7KfWfffe41RQZlMdk+
 XBB2mi2R3rzB2Fw7HZs6OrqWAz4q+XXM7YaDqR6qDrtiwJkc2pgl3/i
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MJYuk1ZES9E0/FFEjI/vXgNTRRO7jY9nsS8GKz42128seD0QC7HO17jv
	j8dFyfAMHea/iHzpAU+CdYuHw0GdBlIMu5xSdeJv2KXyV17WxyUk+qeJKc9JHEmePY5AUji
	s5Jtpe2JsZjEVH1oakE3tV2Tmo3H2AKRi50/wrCZcQ8CEkpYzlS83VGPLnoKFInDRUCr7Px
	wL4fmzsp7eiCv1jRTJqwZQk4Clr2a2vcLcPZ1rmD99TP9UurgJM8aQbvDNSmYYqe2RFCJ35
	6G7Gw29Sr2ZU6QwWZyeTYMyQ2obC6nNNwzhX0tWEBlvjZkGggW8oart3EQQtmXJeHgo8mPJ
	YdLUpWdMbeuGGBxkeM/H55kb9WcAyeHCaT8/jgeVCZbVlYJihS5BQTkdoKE6bYc7F0+de13
	VxoQYlFy8c/w3GRBqwklAmZ/fNseB/oqExB/IHvL4c5LjIIMaOxLwmIaJt9peTkhxNblJ6u
	P14qDSTNnDP4/iz4bYFhT34sVyahq41s93iEBlsK3gR+HYJDrUSpyNb3IxTH1TVTMP9zgsp
	RWddMdb2t24bssyGIO1cxmrw5zOMFgpdBRXnzPaJwCTogCld1f0ByYysawSLEqkokqmJXAO
	24MeLJgjN6etzLPnm+4EYMnFd9oR83BRyVf/A70RixlvY9QIdkbahtq5HifWMHGTpHzGa3a
	6qNFyvTUEp2TzTcyPw189iWYaK9yLII2fWmap6B0Kfy7CRg97TaqwR6wcpxKkAxNmlEpBaB
	y++e9VTH5ofnZKV8BA70LEqyjVd1qbrukk1rk8oUR5rbA+Fsgq7LnOOmDAzCh1kkvDwl/Zf
	vlaLfg05pD5dbH6oLvOd04krk8j+9RpVtE8AqaCh0IKQBa2PzITZQWfQNm0jJMe7m0xcSsA
	rrtxk35rs4QVBxLO+MjsuQBCxEV/ASNt5YZERy9JgiIhLtH5KNmKPXZCvSDF16tOjXRTmw0
	u7TI+r813RdgG0E56U2igVVcthzZ5ZlgvJOfxY2HfTjkNqUa8fKIKq9bUbesF13YmE+NzUw
	dmOU2VjCwyp1e/KBjw24BDv42VonmVn67mPPQfjbUJTnzIrrgvOhI4PtxUMgGJXKysd3/EL
	5MD36pSdjka3q96O6v7Yos2vQKLOWGfv1YGkxWjZSEhg7FXMK2HDVxDPjWDnE6qFA==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Enable the on-board eMMC for MusePi Pro with 8-bit bus and HS400 mode.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 7ca3375910a3da8eaeaf1a7d5398616d928aa875..89a35914710bfd15c6ad27cd8d0de7ccf62e2309 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -33,6 +33,16 @@ led1 {
 	};
 };
 
+&emmc {
+	bus-width = <8>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	non-removable;
+	no-sd;
+	no-sdio;
+	status = "okay";
+};
+
 &pdma {
 	status = "okay";
 };

-- 
2.51.0

