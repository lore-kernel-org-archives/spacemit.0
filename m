Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711C231D371;
	Tue, 14 Jul 2026 09:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784020106; cv=none; b=diBP9toigO/F7M3QyunF6xMoLgfigAgaW07rT4ShJeToLaIQV2KqOEKuykQFHGbCQFjINr34xvaDI/TPw5Tc1SI0dyBFvpgXRBCklWWFyrqyy1XVXM3Pa3gB2pTfBJgUm6OOyoFQ09R5VdR/szywlRvL8ZqE9KbAEuOm3mWCnEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784020106; c=relaxed/simple;
	bh=kgKHrZy1uj7tFrDw5BSke7h+yWJuoKiWrZlKh/92L7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HSRVi7HWgjwtuCk+nKkZD4CeD+F4EfRqypdDki4BrIV6ungTOp9OEiOBIMxEF9xxASoP4dEtehDkPiCVfij8GEI5HGaBvcGw1L7/qIXT8pQBAND3kocKtmnPK8jym/GePj7VU3PZbAOm8tFeTvZBgRijp4VmHuOp4C/7ZT0tih4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQD3p+m1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQD3p+m1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B901F000E9;
	Tue, 14 Jul 2026 09:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784020105;
	bh=mOZghWNextVH5lZml4dvkerUGirxfJ7ODqX5nG0lNww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BQD3p+m1n5ENkk61H9PEkdLklCTAZ57mEpTQsv7zYMdcThamyPf862Kcyyxc24Gzd
	 HyBinEW/ja3H4qui9dqKoHQHlLwK3p2e0pmN148GP3JILr8JzSPsOQnHjRJrlhbQ0s
	 COlTEquvKkTJqp85odLDiWQbYNL4pUnZI0OiaVTV9Hb8cKqdjjy6tOoBCCZ484HaX3
	 eHTvbU4X/jkCs1ItB57v6jtHcAFwXaxmwKo3+lEJuoL7ozbbmAD/nDoMgBZdLRvClG
	 h9GU1BKEi8z1RpZl7Y8HsaRVBDk4L6hxyAoHokqtOkyppN+spXrG2ucyhvVLGoiyFd
	 iW6v+6nkG9+2Q==
From: Yixun Lan <dlan@kernel.org>
To: Andrew Rembrandt <kernel@rembrandt.dev>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional ethernet TX timing
Date: Tue, 14 Jul 2026 09:08:18 +0000
Message-ID: <178402007498.1567320.3036390177940599255.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608182358.170489-1-kernel@rembrandt.dev>
References: <20260608182358.170489-1-kernel@rembrandt.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 08 Jun 2026 20:23:58 +0200, Andrew Rembrandt wrote:
> The "rgmii-id" PHY mode applies a symmetric 2ns internal delay in the
> PHY. On the Pico-ITX board this leaves insufficient TX timing margin and
> no ethernet traffic passes.
> 
> Add a 400ps MAC-side TX internal delay on top of the PHY's delay to
> correct the TX clock/data skew. The value follows the vendor fork's
> asymmetric tuning (tx-phase 73 x 33.3ps - 2000ps ID ~= 400ps); the
> driver rounds tx-internal-delay-ps to the nearest supported step.
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: k3-pico-itx: Fix non-functional ethernet TX timing
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=773a0731959424d7f82be207b64acfa5b99a4978

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
