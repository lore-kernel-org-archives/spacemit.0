Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF30346E57;
	Fri, 10 Apr 2026 23:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775864268; cv=none; b=YA552OI4UAngcNT7OSU9skDYW0+oJ3Y1ot4JtfBWbJGnxyy1ghDdQVUsQ1VxfFXLuQsAJPazdWEV1+1Lkc7L6CFrtjDtxyatL3Pj3BXpi+bEsJXc+8XwUy8+orSLa3QKhoEq7u1MEY5UN4/kdftC403LfOoeXtxFb011AF7xKU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775864268; c=relaxed/simple;
	bh=9nyWpvl587TXnw2WHO5q+qP+iVSustuNqLD/U3XMv24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7vo8Tn4BBA/BRNC+NcMml+VdptUPLjSpG0rFsS+EqbwP7CYgor+2nTHTDy1z4Bzs67Jz4CbqATVzpO2+o+jUi1LpMYkAhZ6KPazyS27j/y9B21Am1i6eiUPjtr24fdwkrE9zDu8w9r3S1dwrJY6dbPF46eoC8Y32azFmzmE5zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNTF2OFV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNTF2OFV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4360EC19421;
	Fri, 10 Apr 2026 23:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775864268;
	bh=9nyWpvl587TXnw2WHO5q+qP+iVSustuNqLD/U3XMv24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iNTF2OFVv6rlhpMPVLGC+iL5F/WSz2Ou9zFlHB24lyGAb8rY2iRQ01M9hYtEXtKbg
	 9lzVb4h1hhLNMNbaeq8zIFpV8w+34Je76IAJbFh+U2DBC6HuGiDzwU5yVm1zabkvVw
	 ZIIC7RQqZul1N8xHXtf1+VwqxZD9FGCtcKmEGTbmHqnr9VWm7wJC0oMsboonlD1U2q
	 eA8yiYXsE/4fqTO+0H0UsOLxbm46bfgyqVWLEGuiOn5HgDapTGZjzY9AN3CcAZijjY
	 QCIAgPpBv7QFFIDxu0ibTSk20g2kr2aXQ3YrO5FxdA9heCdDTuo8xQqALxJlLIj5VW
	 6GmJvWyuUcOkQ==
Date: Sat, 11 Apr 2026 07:37:46 +0800
From: Yixun Lan <dlan@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org, Yixun Lan <dlan@gentoo.org>,
	Arnd Bergmann <arnd@arndb.de>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.1
Message-ID: <20260410233746-GKA1167630@kernel.org>
References: <20260403123040-KYC0145825@kernel.org>
 <CAD++jLkQfUwhvDOCkhK2NtRyXrb6y9rwpDckR6h0G3+dzYwW3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkQfUwhvDOCkhK2NtRyXrb6y9rwpDckR6h0G3+dzYwW3A@mail.gmail.com>

Hi Linus,

On 00:19 Sat 11 Apr     , Linus Walleij wrote:
> Hi Yixun,
> 
> I looked into this pull request.
> 
> I'm sorry if I do stupid mistakes in handling it, I'm new to maintaining
> the SoC tree. Bear with me.
> 
> On Fri, Apr 3, 2026 at 2:32 PM Yixun Lan <dlan@kernel.org> wrote:
> 
> > Aurelien Jarno (7):
> >       riscv: dts: spacemit: drop incorrect pinctrl for combo PHY
> (...)
> > Yixun Lan (9):
> >       riscv: dts: spacemit: pcie: fix missing power regulator
> 
> [Fixes]
> fatal: Not a valid object name linus/master
Could be the problem that your master branch isn't up-to-date?

> Commit: c68360c0d636 ("riscv: dts: spacemit: drop incorrect pinctrl
> for combo PHY")
..
>     Fixes tag: Fixes: 0be016a4b5d1b9 ("riscv: dts: spacemit: PCIe and
> PHY-related updates")
Above commit was merged for v7.0 cycle, while this PR is for v7.1
The fix isn't that critical and didn't cause any run-time issue, so
I do the fix in this v7.1 cycle..

>     Has these problem(s):
>         - Inspect: Target SHA is not ancestor of Linus' master branch,
> which means it is fixing commit in your branch
> fatal: Not a valid object name linus/master
> Commit: 8a9071299dec ("riscv: dts: spacemit: pcie: fix missing power regulator")
>     Fixes tag: Fixes: 0be016a4b5d1 ("riscv: dts: spacemit: PCIe and
> PHY-related updates")
>     Has these problem(s):
>         - Inspect: Target SHA is not ancestor of Linus' master branch,
> which means it is fixing commit in your branch
> 
> So this means you introduced bugs and fix them in the same pull request?
> 
> Why?
> 
> The practice is to squash such fixes into the offending patches when
> presenting pull requests. But I went ahead anyway, trying to not be so
> picky. (The commits are there, in your branch indeed.)
> 
Glad to learn this, I will keep it in mind..

> - Checked that it was in linux-next OK
Right, I think the commit is actually in v7.0-rc1

> - built DTBS OK
> 
> Pulled in, thanks.
Thank you

> 
> Yours,
> Linus Walleij

-- 
Yixun Lan (dlan)
