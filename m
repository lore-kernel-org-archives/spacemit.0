Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D882FC86B;
	Mon, 26 Jan 2026 22:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769465425; cv=none; b=O6ahHcwsJTs7I4MeNBkt+18VcGkMOxD1F1TPcquyXtHiPNx4y1GzI+EqWP3K/XqJsQnwkjEdnxOCkFNADBDYpgkrLqDnscsKtyRkrvy+w/WRvSBamIhNA07Ac7+0GO6Isn3JIy51jFCUC8EN+mlUWCwYHyKEz4NgiCe5zf38rig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769465425; c=relaxed/simple;
	bh=e+VY0YiRm9WdQtrKQ6RfFsmWCSJBN/5QaCkWJ9Ungeo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b1837LnUtaEvr3TWUUe2I9Ytd9HRhU211/cbYaYLTBOdrV9n+6gyUJmWs0qYXa3ZFSRR0znOy4SDcmUx+RhCe6jWaSo46m6zyY4kAmKx6ehbFapM2J9OHiYjHtdIabSlwbrfM7c6S/0vZdKXSRdfGCqWepoGQ4MGq0fH3xOLqlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTzAxIhk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTzAxIhk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64C9C116C6;
	Mon, 26 Jan 2026 22:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769465425;
	bh=e+VY0YiRm9WdQtrKQ6RfFsmWCSJBN/5QaCkWJ9Ungeo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YTzAxIhk/pSa4n+8h0Gf3q+yExDMsiza3pkly3tahdJJHRSJd35Q5TYaFXlAM1CXY
	 OTjU8wgz9qT5K9cWqLgJ1uUQNdbe/RBLE+AYBFRGmhBCFqwBgkqyrpidQYaxLofW1y
	 +wTgXTx6PDWZSYkHsp95py0UlAMwejEaEAu0pLKb3LKbXAoJjd3GUZ9cWXKlqCXziO
	 ih2kDfXP5UKpLS7HjiyjaZxADKmMSPpZ6+XK17taEH0M61guoBpIxs3MBvs4FLv50l
	 qYi4Xjvb4ocp2Py7dmdxfCAG61NW+6ENPQVpTjNm8NL1DW2XlMYkZe02S6Zmarpk3X
	 vfJDnvk8MylJw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
Subject: Re: (subset) [PATCH 0/4] regulator: spacemit-p1: Fix voltage
 ranges and support board power tree
Message-Id: <176946542165.977042.9433935491443420344.b4-ty@kernel.org>
Date: Mon, 26 Jan 2026 22:10:21 +0000
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 22 Jan 2026 17:43:41 +0800, Guodong Xu wrote:
> This series fixes hardware voltage constraints and enables flexible power
> tree configurations for the SpacemiT P1 PMIC.
> 
> Patch 1, n_voltages is corrected to match hardware register widths, as the
> previous values prevented regulators from reaching higher operational
> voltages (e.g., 3.3V on LDOs).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/4] regulator: spacemit-p1: Fix n_voltages for BUCK and LDO regulators
      commit: 41399c5d476156635c9a58de870d39318e22fa09

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

