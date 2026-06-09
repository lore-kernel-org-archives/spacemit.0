Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA3729C327;
	Tue,  9 Jun 2026 13:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011524; cv=none; b=sPJ/VHXHPtCOY6jc6Npe06jS9xzEBB0SeRNMmcDzI3O40NlDIOA1tGmHJ1vNnNOYC+DFuc5XhUSfG4YB0NbhlG5XBbFRYHoQYs24ke1UK2odJ4yb3JNhoXSps0axRi64MAt8z+xp0YAW4lmrPyl1xFsIic4KB1J5l/IuIhpYaT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011524; c=relaxed/simple;
	bh=9jfMt2cOOb2Vo5RMofKtp040Q1Gf/YUkYnkvwht2/aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEpxCtqmAxSZDwE8slT24cUXE73dnTvcISAfecmqvgSMdRXX0ZFC5QMID5SQJ+Kb9tCujlBRBS1wmj2Vx4IQlxF5HVpAiOJpqdWSVXWPjeDggMn8ZS88VDfyhAma9WwkAPro8+RvwwzBxqrT1TIgmcYGQmpPdJ95Tr3BdYvr72A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHyWudfK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHyWudfK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFA21F00893;
	Tue,  9 Jun 2026 13:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781011523;
	bh=B6TkRhG5+Ds3utEFEpay7wCt0CilVZNJBgxZkSf2JNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BHyWudfKEQ5HKfEsW28NY7tSb9PYXVdivTFpunDHbLxVPSIxiOh4a8JONaHdlM7g6
	 8bE5kARvXLX99UKuBnXFEisOYBHBiC9WqMFwIYK8NSYFvEB35Yl5/2AFdljZbBorUC
	 JSWNpU1Yhbckk8uPtaRGcrPdmIKr+KALTvVWc7HeQeKqY5Belz4JRGQ9rO4FWRGDml
	 W+z2u6CABSxTR66AJrRulk6qt3phnOwtbnp5CXDggv3el7orB0ZrrKLAV+qdZjuBp3
	 /gO13JdV3Y0kHmUX0VzxB/S9bSAQtatmhk22TBFoac5C+wgMn6WV6dlpX0TuZeK0Iz
	 mmQAUy5jsS11g==
Date: Tue, 9 Jun 2026 13:25:20 +0000
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.2
Message-ID: <20260609132520-GKE3727415@kernel.org>
References: <20260602070257-KYC5031219@kernel.org>
 <20260609-pompous-imposing-dragon-fc18cb@quoll>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-pompous-imposing-dragon-fc18cb@quoll>

Hi Krzysztof, 

On 14:00 Tue 09 Jun     , Krzysztof Kozlowski wrote:
> On Tue, Jun 02, 2026 at 07:10:07AM +0000, Yixun Lan wrote:
> > Hi SoC Maintainers,
> > 
> >    Please pull SpacemiT's DeviceTree changes for v7.2
> > 
> > Yixun Lan
> > 
> > The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> > 
> >   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   https://github.com/spacemit-com/linux spacemit-dt-for-7.2-1
> 
> Please switch to kernel.org repo. Github is not really a trusted place
> and you have kernel.org account, so not sure why Github is still there.
> 
Ok, thanks for the reminder, I could do the switch in next merge window

For reason why I still use Github, mainly because I got kernel.org account
after taking the maintainer role, then never change the repo address..

> > 
> > for you to fetch changes up to 793cc54475b49b5b558902b5c13e4bfe66530a50:
> > 
> >   riscv: dts: spacemit: enable PMIC on OrangePi R2S (2026-06-01 06:32:42 +0000)
> > 
> > ----------------------------------------------------------------
> > RISC-V SpacemiT DT changes for 7.2
> 
> Thanks, applied
> 
Thank you!

-- 
Yixun Lan (dlan)
