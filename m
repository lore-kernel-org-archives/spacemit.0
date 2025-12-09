Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6022C0270;
	Tue,  9 Dec 2025 10:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765275720; cv=none; b=Tsj/QmcaUDa8Y+29jrXxOVxQIWdidwOmEFkpwkAQ5uERugCR2Vec7Z9mIaHnuwE0SS8nvCOErfgLAuNdMAWrh2K0BUALEJGJBTkGSea9m4SM1vy2HDYwLXab5WZOaQMkRtummyExe31RfviVdeDT9YBIF28wBXp21UuLjMv1Nak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765275720; c=relaxed/simple;
	bh=JgYIw3ICBrpjk2agf17x1ioIPfJ402eUxH3SB5S+2xY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hM09u5ykNwap63bbtxYolcBx1dBmFoBn3y0Q+dLkJEcX2xYTeibEGIksVnDj52VTD/YtSKfbT5c1B6fhq2zyG0vlcUwcwoIlFW6k3Ydo1w80I/S7z6bo8EwXe9GNo/G/uNQtIVT+FyAXFXI2TB7LoWC6AUApXDSp9fUQUvAJnmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbGKERRN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbGKERRN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9C3C4CEF5;
	Tue,  9 Dec 2025 10:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765275719;
	bh=JgYIw3ICBrpjk2agf17x1ioIPfJ402eUxH3SB5S+2xY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WbGKERRNRYy6gW6/W/bFlLsP98T+EQnkqyCCqYlyww81Nmak/e/s+N6QS69RW5Hsy
	 /2RI3XCmMnRCfyL/LcFr8+Z3W85G2ZaOB5LBYcYuDRTQn/gCJNmFIiDpajoU+9O8c+
	 vpYs76S0VU1Ldu5qfwQ2+LTK6eFmolkLLpFTfbBokamUWrcy2g1iap/OKqajHGmBex
	 wQOfGG21Qr0b5qceYqFvuOLCMw5h5sAQrwkA6AZkbBqeGyrC8MmCZRPh3hD/5ElLFS
	 vu0UuYBmhXy+MvmHACkmcOnglPb+Z8KorQlA5NY/YPuftsLoBjHh6vu8NYaIOzdult
	 2UdOXsqsJUh1w==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Alex Elder <elder@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev
In-Reply-To: <20251206133852.1739475-1-javierm@redhat.com>
References: <20251206133852.1739475-1-javierm@redhat.com>
Subject: Re: [PATCH] regulator: spacemit: Align input supply name with the
 DT binding
Message-Id: <176527571370.622933.17720204195171811423.b4-ty@kernel.org>
Date: Tue, 09 Dec 2025 19:21:53 +0900
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sat, 06 Dec 2025 14:38:48 +0100, Javier Martinez Canillas wrote:
> The Device Tree binding schema for the SpacemiT P1 PMIC defines the main
> input supply property as "vin-supply", but the driver defines the supply
> name for BUCK and ALDO regulators as "vcc".
> 
> This causes the regulator core to lookup for a non-existent "vcc-supply".
> Rename the supply from "vcc" to "vin", to match the DT binding and ensure
> that the regulators input supplies are correctly resolved.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: spacemit: Align input supply name with the DT binding
      commit: 99f0c3a654c4a762aca4fadc8d9f8636b36d570a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

