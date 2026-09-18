Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A585411F93
	for <spacemit@lists.linux.dev>; Fri, 18 Sep 2026 23:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789774851; cv=none; b=cozTE/Q4BDZ8je8Xf5B3js+OeoALQ2oXHT8GsEeygcYQpfdjAGDUD1D/7i7l05nJiwNqcl0F5JaflpmahvihJjMa2zwIiVPU7rch3u8hgjg4Trv0lYy1HEiSk+ijPhgqmaYSHDIkWgF0HxUHijsZ7fOHI/DzQAbgop30CvlJ+vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789774851; c=relaxed/simple;
	bh=9S4X30hI+TNgEIseZ/ThHjHnldvfWRTtLI565UF5YZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tt886xnvUv/O1gIJ5bNkPSgtUaFnvckVFjaP8J9bAkOwgniIfiwH6WWHNM4GuAeqqIxtIzknwLW4O1rURyW6rhDtT2FwSx+WKTMXfRtgyFy8yCClC/2PbLedf9JcRNZIx1q6ZNk1pN+VfqUriuQNOzFV3gxvTxZiuDK9z0C1mgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0pkNeyZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0pkNeyZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF251F000FF;
	Fri, 18 Sep 2026 23:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789774850;
	bh=7/OmzgRdcVgmVYiDhUfrz6X0XSFQ8iwDW84lgQNGZnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z0pkNeyZsEAbbj461SlBcKzBNGBOi1V1G5aAeOzsKiKJDrzZC2eWAaZxr1NfBe26m
	 PLw2+t8iAdcBuqQsCV5FaeLT3uxlDTE8x+elEsOWEsf6r4FVuA2E0lP6VcXcXkiVV7
	 FqMteFnGjbgFFRteci4HWCZFs01S7OUwmDaW0MxpU1g/aiIjPk88V5rnMuL6M0MbEj
	 SOb8depbGNKUzbreROneazwJPYr6OFA3oSKrchc0hasLF4mZtYLR38mdqOmQjS3aCG
	 dYKOXwpN/325KtHBmzo0crwHMGiA/MHh8Inm8K7LS9DwnjBS62NsOVI5nl0J/Ysl1T
	 vCIwo/gZJcDFw==
From: Yixun Lan <dlan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andre Heider <a.heider@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: add cpu scaling for 3 boards
Date: Fri, 18 Sep 2026 23:40:45 +0000
Message-ID: <178977476488.1116261.11214063403240767107.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804133236.205668-1-a.heider@gmail.com>
References: <20260804133236.205668-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 04 Aug 2026 15:32:31 +0200, Andre Heider wrote:
> This series adds cpu scaling for 3 boards, each authored and tested by a
> community member on their device:
> 
> - k1-musepi-pro
>   fixed include order
>   v1: https://lore.kernel.org/all/20260614122812.2287506-1-a.heider@gmail.com/
> 
> [...]

Applied, thanks!

[1/3] riscv: dts: spacemit: k1-musepi-pro: add cpu scaling
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=2961d968d0cf1f8f696e822b900943d6c1072a66
[2/3] riscv: dts: spacemit: orangepi-rv2: Add cpu scaling for K1 SoC
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=e56e2800e994d251486a3988209e07a711eb95b7
[3/3] riscv: dts: spacemit: orangepi-r2s: Add cpu scaling for K1 SoC
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=4947ee60bf48caddf5caefc08dbbc84d09fbbc6b

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
