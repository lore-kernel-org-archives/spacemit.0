Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F6515746E;
	Fri, 23 Jan 2026 22:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769207509; cv=none; b=Pkfs6NnZEqSxnfGabJZJRjtnwJ3OtZDekwQMKzvF1v8jhpVsmJvvq3H80pYuoUMfEj5iT1xMhH6V7EX+UrnF6xhMl1GYU/sC2V+mSkLluEUtef8PZaerm/ZqY4W6XwhuqTxgh/bS3cdG/hBiBZXQ5Nn0Rxc4b5Cqow5Grc7algE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769207509; c=relaxed/simple;
	bh=HyVIiSrJJIt7GX/lLQJuD1cL5dFgVqaR0/nP435+22k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ba86PArxx0tMMOtXm6ZgGb0h1kV0oqe8TNB4N5NpcrbSgI5+YogNY8VAmH0zDUlVHfXq8hryVIDBWshM/XUU6jVSIZ8KNAZONYUplGh43OZaLnIIT0KD7HJsqahz2j7VPeGsax1Wicy9FZPUzw3G976CG2D5v8etr5vzcstK4rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pgGVlCzC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pgGVlCzC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DCBC116D0;
	Fri, 23 Jan 2026 22:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769207509;
	bh=HyVIiSrJJIt7GX/lLQJuD1cL5dFgVqaR0/nP435+22k=;
	h=From:Date:Subject:To:Cc:From;
	b=pgGVlCzCgYMcOs9xVbUI1i0nDPLUhoLLjEnVZeaJruwMMObft7qFsw7Piz6foD8Ne
	 jjcl2rk9co8DvIJ78xZbO8G/ppAwHIILYpYOgoDs9krH/mGw0nY/00JeWWFc5Bngoc
	 nZmG+7nnA9TTdEi23LO+v810xhYKn8rurg/5a6kVrl4Pl2MvFUaw4+LteysMaVlLYC
	 BPVbzYwyrvGXW+MZ+2IeAvpXpGf25GwF8NwGpB40LY+nTWuTxKoag12S6SNUElAqMf
	 Do4ae6hbzCANGGzbGjLHBo8lX23bYiyJL/9l5KBui89G5uM+757bCAfzVRFpsOehk4
	 VJYHefCmHGiVA==
From: Yixun Lan <dlan@kernel.org>
Date: Sat, 24 Jan 2026 06:31:28 +0800
Subject: [PATCH] riscv: defconfig: spacemit: k3: enable clock support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-06-k3-clk-defconfig-v1-1-802674ef2762@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMD2c2kC/x3MQQqAIBBA0avErBvQNIOuEi1KxxoMC4UIpLsnL
 d/i/wKZElOGsSmQ6ObMZ6yQbQN2X+JGyK4aOtEZIWWPwmBQaI+Ajrw9o+cNSa+KtNLaiQFqeSX
 y/PzXaX7fD0Wje8BlAAAA
X-Change-ID: 20260115-06-k3-clk-defconfig-e4b3e4344d07
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=dlan@kernel.org;
 h=from:subject:message-id; bh=HyVIiSrJJIt7GX/lLQJuD1cL5dFgVqaR0/nP435+22k=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpc/bQO3/YysBjB+08qB/g/sLBKStT/t+0Uy+q/
 YY1zKVOFGuJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaXP20BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3iWQ/9Ht8S3fHsF5xv9fnMTZD6ZmRPjgyHOz47srRkCHjTVA395ClrdCmoT
 mpwk+Y9AJR50ioswjGt3ii/MtCPU1kvNXSUkYUqUNkzy/WO27Nx4OCkx/EjkwU7brXrp9jWQKCl
 DVtuwbcxJM+si8mxhmxtAuBoOXX4FGO39iGB2F6dN26DVPDQDRJqx8c6FCa3p51Tu+isDsiH5DR
 RbExD5QeFtiP3OuL/jt6CAlu1nHs5Cfpea1+5Y28C46lAZJfEslWu/oxawdykK6JEopOxyBXvri
 vcr2GWdvj7e7rnyKzL0e8pCNhDhH5LH+AFhCetBVCNH/NdtvCJIyFZSZ84wobZ3Uv+kHt9iyEpV
 6qS2WyTAqMNMm9gQLmURbjCiost7OklBz3IHMIqXXKKxCjA/yrMPlWMwVI5YSaiDxipWi4xDgvE
 FD74m6BfAmcESGo6pNDQNs44/2VxNdz4cr0gr8FS69pcrgzbuEGVBFxBkE/tSJ2QuvWV9UFoE4t
 T2lERh/V7tq+HLc+eUPqRbqTW8j9ZqC+Sq/YvQ6q5SKr64oL9v9NuDXICfIQcWnBg7bcWnc5xqZ
 fGmXdx/oS9Ad7fWGyw6CwhQQffpJOP7P/cB80G8jEobFv1kqW+y6hjx5VxbfjDx7TJzpkbPtIyz
 8Ch++sE54f/BFuBZC5Csl3VdJsGvpw=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Enable the clock driver support for SpacemiT K3 SoC, configure it as
built-in by default, but users should be able to change it as kernel
module if needed.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
This patch depend on clock PR [1] which already accepted by clock
maintainer.

Link: https://lore.kernel.org/spacemit/20260114092742-GYC7933267@gentoo.org/ [1]
---
 arch/riscv/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index cd736a1d657e..6ce600081a6b 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -255,8 +255,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_CLK_SOPHGO_SG2042_PLL=y
 CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
 CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
-CONFIG_SPACEMIT_CCU=y
 CONFIG_SPACEMIT_K1_CCU=y
+CONFIG_SPACEMIT_K3_CCU=y
 CONFIG_SUN8I_DE2_CCU=m
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260115-06-k3-clk-defconfig-e4b3e4344d07

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

