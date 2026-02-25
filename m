Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F91395DBB;
	Wed, 25 Feb 2026 19:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046443; cv=none; b=sLSoQkPsSCmoVqhnxqBw7Hj8IllAj/p90qi3L0Gubm3BNszd4UrM8bwlvgI/yaQOr0DDA58Y4cC0QiGIQXm21YO9JMHzjxIbV7OTimXZB9vZM8O4YVHU1T43Levh4fSIMQa02M0lgqnq/eZHCx8o3ZXHJaPabqAc7kebXM8W5ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046443; c=relaxed/simple;
	bh=UGnc2yVLBjOJ5bDB3H1khNOj/8vIce5Y8Yoi+iCQMyU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Mg7PTUoHBcqDDbBwNF+s+gph1NrzLPmHH2b3fQFIp1k+SeYPjYZhWGJmXQyiCUh7Z1KuxzBt5GXxzohGf8CCyYWoL7PbsSXf3jnvUcKFfZvEZUrE8Hx9unqzuHWWwrtxHb6WEh54KwLdFgk6Fu58eBr+hIDFdE+7g7PxbG0HtOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lecPiPqc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lecPiPqc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63176C19421;
	Wed, 25 Feb 2026 19:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046442;
	bh=UGnc2yVLBjOJ5bDB3H1khNOj/8vIce5Y8Yoi+iCQMyU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lecPiPqchaN4Uyd5EMQC1EphznXv7RUrLbFWfSCDaTnuy5bNKLVw1euxrNWZo4fo0
	 pUDN8xo5d2A8fSuTZbtzcMyPFD7T4RWlWof1fKeQ1c7MX6LomD8sC8i+XErZtS0Gzz
	 1ded8xGVpVNFE2hf8czTOQ7cTGQ4RnWgZzlVwagBJex1vyv8xdYFzTSI28WH3yaJyU
	 SrpRS+vNekkwchbXAGGZHOelOZp2sqmGV2SwewmJVk9x2HLyWfrsxoOjW8POnpOKXE
	 4URsYbQYDQaf2roED1HX+Q1VGvSkS6Ek+J0hgsgv3lcu7xX5+1NUoAuMrAGyeO6lOG
	 7JDifDqd+SMwQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
References: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
Subject: Re: (subset) [PATCH v4 0/3] regulator: spacemit-p1: Support board
 power tree via DT properties
Message-Id: <177204643911.168523.3724548692200647978.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:07:19 +0000
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 06 Feb 2026 10:32:01 +0800, Guodong Xu wrote:
> The patch (Patch 1 in v1 and v2) fixing hardware voltage constraints was
> applied to regulator.git for-next, so is no longer part of this series.
> 
> Patch 1, 2 and 3 (previously 2-4) enable flexible power tree
> configurations for the SpacemiT P1 PMIC. Hardcoded supply assumptions
> are replaced with explicit devicetree properties. PMIC supply connections
> are board-design decisions. Moving this to DT allows supporting varied
> topologies without driver modifications.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] dt-bindings: mfd: spacemit,p1: Add individual regulator supply properties
      commit: 82ffa9610ba39d3628a9bec968ddc68fe2fe6612
[2/3] regulator: spacemit-p1: Update supply names
      commit: fbb4c52ccdcb4a612d2b7f800aa57090eeee16d7

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

