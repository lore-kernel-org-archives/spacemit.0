Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F983793BF;
	Sun, 10 May 2026 12:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778415844; cv=none; b=KlssGIPZ//elGOh4JfitYImXhgemuoOwazsV+fbvCtY++8DruxtI64n3GDIWPMqt9CtiZTw0QrgWm+//XialY3gi8a9nVyCPV02OA1A33LQEZY1HpGfqBowlJB2q8uDoa/WewVfnrD/I8XRVJzHZvjJUUNPaDxR10O5JzcWBLwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778415844; c=relaxed/simple;
	bh=NDt3RJVWprBMRZL1hBTLG//fICJZ2Q/u+HUTRUNib4Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VVyWEnmVT+2uHro18Epak0lp2k6u+vrHDGW+CWzWv/nN0bWUVfp0LsS3LZrGnuT23Hu2sSoSPk08eWUdmnxzBVqfqKAX1GnMlZcqlGpNyHVLITOFLKhqkc+bJPPeFNsZsx8t1rwZ83rJlnbqc/gPETxZogDRpJQAqBzjjBCWrXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AfWwBhQt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AfWwBhQt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775C3C2BCB8;
	Sun, 10 May 2026 12:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778415844;
	bh=NDt3RJVWprBMRZL1hBTLG//fICJZ2Q/u+HUTRUNib4Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AfWwBhQtpDxEhQxpko4dQ46hRgQTiqKB/8Ckyw078zeELmg7rpPomWKmGC78rcu4A
	 HKr39pjE0ucLVhCUrFO174K1CA7NUSZ08A2kx+n6pYCMIqRroe48AsBnaNkVYk6Pm7
	 9oeXMiN3uNqkcDsu1wT4uul/lXLyvGJPy76Q3aoyCWTVleyiX6nr9+ieFemMaZN+DA
	 KM0asltdqcRSqIDqg/JN4y/oIqj0cFmDDGdVvv3fgImXU6+A5PHKVWpOIG5TdeM8Ck
	 0sfCH3VwS67s6qcA1dPxDkFfmbkgJ2hWAL3ZDgltR0FeiJDx2jK+jg9wnVlyk534YF
	 xaU/m6IGfmQ9A==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Yixun Lan <dlan@kernel.org>, 
 Ze Huang <huang.ze@linux.dev>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260326-k1-usb3-v1-1-0c2b6adf5185@gmail.com>
References: <20260326-k1-usb3-v1-1-0c2b6adf5185@gmail.com>
Subject: Re: [PATCH] phy: spacemit: Remove incorrect clk_disable() in
 spacemit_usb2phy_init()
Message-Id: <177841584101.420676.11785245534258956583.b4-ty@kernel.org>
Date: Sun, 10 May 2026 17:54:01 +0530
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 26 Mar 2026 00:23:58 +0800, Felix Gu wrote:
> When clk_enable() fails, the clock was never enabled. Calling
> clk_disable() in this error path is incorrect.
> 
> Remove the spurious clk_disable() call from the error handling
> in spacemit_usb2phy_init().
> 
> 
> [...]

Applied, thanks!

[1/1] phy: spacemit: Remove incorrect clk_disable() in spacemit_usb2phy_init()
      commit: a4058c09dd6e28ec33316fd6eb45ddae4cab1f31

Best regards,
-- 
~Vinod


