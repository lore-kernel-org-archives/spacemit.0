Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF12A36B910
	for <spacemit@lists.linux.dev>; Fri,  9 Oct 2026 07:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530775; cv=none; b=dy+EyA3V8QijWtQYa8p7HlKeP3bFE8iwUJx4Gb8yprTyfRw8DJ7h0ncSwBnbRiUEuEMU7BJphgUbv0lhtbNMt+7csSlNKHLXy0/kjXhfsOicHFe0Pi0xAouZv0BAhuhUcBrzXTjgnU3gdNwFRJxV9oop+K1PLO+WqiZYbOaPyjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530775; c=relaxed/simple;
	bh=7OSwb1gcSKSVm0zaNwldMNDH5wgRhjWZkE7DteE169Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uGyvPW+Ev3OV1hkAI45GfDkyrdcnE31/OOOeSdVx0+qJEdUCir5wV3m0Te/purCJdCHo3y/ooXpZMcEBHViWK3YiraZ9Fu1CiM/5WZXD3/v8zjQ0xoPD4SNQBZAdA1fJCDs7rJsfdkixT9v3fWVP2zAN8wThZoaiwcFeDlIxWEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QC67uTlH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QC67uTlH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688151F00893;
	Fri,  9 Oct 2026 07:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791530774;
	bh=R9j20iS9o6/AyqFTX7nD8h4FKx4tYreSSVLg54LPoTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QC67uTlHtEfKqXkj6H+r3cMJCS/dAhUBhd2q5ahQJtUUJ0KwtaaKLT16Wmpm8vBOG
	 9ymJ5NxkDG1g9sNH6E7WHHbiIlyLTLPV4tTZ2tK9tEaSbpD2AfEriy5+zP8odNZaCK
	 0Oa7uyr54kqmWV70yGH9wmkbYQgYk+66cOvZoQtOUpbv1Dszn5/nBwWyGYeQAZwTgW
	 ZQyHtXnFJnT36OqbV7Eki9Hav5/zUCZR4+iCw6Ictx3EZ6PpSrLYGnHO1hyw5O1O2O
	 enoT94lC/FoHHSh33iZgMFSXIpi8i5SR1+BA8/mEWagZEP0q4geaXTAgREIrjciNOx
	 3GXguIaxcq3qA==
From: Yixun Lan <dlan@kernel.org>
To: u-boot@lists.u-boot-project.org,
	Yixun Lan <dlan@kernel.org>
Cc: spacemit@lists.linux.dev,
	u-boot-spacemit@groups.io,
	Tom Rini <trini@konsulko.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Raymond Mao <raymond.mao@riscstar.com>,
	Guodong Xu <guodong.xu@oss.qualcomm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Torsten Duwe <duwe@suse.de>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@flipper.net>,
	Lukasz Majewski <lukma@nabladev.com>
Subject: Re: [PATCH v2 0/8] spacemit: k3: add clock and reset support
Date: Fri,  9 Oct 2026 07:26:08 +0000
Message-ID: <179153072641.119292.15754263087303903316.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260923-01-k3-clock-reset-support-v2-0-6ec0abb1c7b5@kernel.org>
References: <20260923-01-k3-clock-reset-support-v2-0-6ec0abb1c7b5@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 23 Sep 2026 09:34:23 +0000, Yixun Lan wrote:
> This series try to add clock and reset driver support for SpacemiT K3 SoC,
> the patches are largely based on upstream linux framework.
> 
> The reset BITs definition lives in the same register with clock
> controller which make them tight coupled, so I'm also putting reset
> patches in this series.
> 
> [...]

Applied, thanks!

[1/8] clk: spacemit: ccu_mix: fix inverted condition in ccu_mix_trigger_fc()
      https://git.u-boot-project.org/u-boot/custodians/u-boot-spacemit/-/commit/d1a7fb596ec6717e26e1760c5a3e1adc1294e6fe
[2/8] clk: spacemit: ccu_mix: add inverted enable gate clock
      https://git.u-boot-project.org/u-boot/custodians/u-boot-spacemit/-/commit/d2cc0aa2ba32d231a73a10cce7ba332bb565d21d
[3/8] clk: spacemit: ccu_pll: add plla type clock
      https://git.u-boot-project.org/u-boot/custodians/u-boot-spacemit/-/commit/57ecf2e5448fb0e6ecc9f3266463f1cc82ee74b9
[4/8] clk: spacemit: k3: extract common header
      https://git.u-boot-project.org/u-boot/custodians/u-boot-spacemit/-/commit/c80731fa324700db2c1a5b7725bfbe7ed93d50ef
[5/8] clk: spacemit: k3: add the clock tree
      https://git.u-boot-project.org/u-boot/custodians/u-boot-spacemit/-/commit/efe62df16050cd68130e07f209379c38657819d3
[6/8] clk: spacemit: k3: add CPU PLL rate tables
      https://git.u-boot-project.org/u-boot/custodians/u-boot-spacemit/-/commit/20c4c8b4099592ce172f6cb78b31cb8d9d68f193
[7/8] reset: spacemit: Extract common K1 reset code
      https://git.u-boot-project.org/u-boot/custodians/u-boot-spacemit/-/commit/c2dcfbe319b0e5e77cf4f350531f04c9fa9a7a46
[8/8] reset: spacemit: Add SpacemiT K3 reset driver
      https://git.u-boot-project.org/u-boot/custodians/u-boot-spacemit/-/commit/89269413d4f53b77a86946a78a291aab03f7aebd

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
