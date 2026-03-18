Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833543D7D91;
	Wed, 18 Mar 2026 13:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773839870; cv=none; b=pd/9O+y1BnVNvsx3so0aLLWgUspYeViglxJ5Imcbp6aIy5gaxnQjbqdDu01FGKjpUhaK8vrp1TeV7E7C/jSVKNW9JB92+RoMpnTUK8IANO3Uhy+Wos83UgRRns6r1xiK/y2hm2NsIU4SpTMQEWcYHV2BjqvjjJD+iUi/a8o3xck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773839870; c=relaxed/simple;
	bh=NWoOHxrlHQBNsiY+UBVVePy1w1a1sjeoXf1OTtfhM7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPchI8gkxz83SnvteYgqJpX5aFHQooBs+2y5XwsbKsJqYu3X82pYrPRMKuozR2e/4PphessVQyuLM8udlfCwvtgsVQw+ZAVVEa0fN9K8//D0IE0XBBzn3khkKHVDpmyMAxCyugQ2H6svcLe6KqpzCe+VvSYaOyqGhXcCKNH6DNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1t6aZ4D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1t6aZ4D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992B6C19421;
	Wed, 18 Mar 2026 13:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773839870;
	bh=NWoOHxrlHQBNsiY+UBVVePy1w1a1sjeoXf1OTtfhM7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1t6aZ4DV8idhy50Zvde4N76URkcYhAPWskzmGqXzZo4gJPa673NLgFrVAWL1PpS2
	 Jew1loWVXwaM2ZGlzwanp3fR5krtkDMdqqmAJPoylZl86TH7ec4ux3orzvfncRMyPh
	 s8FdopOgPYPiGQF0SrcvbOzAvCyzGVjmM5ytqMPa8AP5jbJs8p76ONUVs4r/T8K+ij
	 EM0JvYsC0cCBzIQcvc4i4M6dHQlQBCe1iAfvH4JG9kPyockIkv0tJwAQXzPGxusqF4
	 s2RciUDmH/ixJZ0JhcDq6s1y4zcnpzJuR0OVFa1kJa++9btEuOonLDa8tHc0i96SIu
	 Dn40kXyplPYqg==
Date: Wed, 18 Mar 2026 21:17:47 +0800
From: Yixun Lan <dlan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v3] reset: spacemit: k3: Decouple composite reset lines
Message-ID: <20260318131747-GKB488271@kernel.org>
References: <20260317-01-k3-reset-usb-pci-v3-1-e4b9a43c7d45@kernel.org>
 <3e9022faae3dc6f5066a1e7cc3752a0193a55bc9.camel@pengutronix.de>
 <20260318131043-GKA488271@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318131043-GKA488271@kernel.org>

Hi Philipp,

On 21:10 Wed 18 Mar     , Yixun Lan wrote:
> Hi Philipp,
> 
> On 13:39 Wed 18 Mar     , Philipp Zabel wrote:
> > On Di, 2026-03-17 at 02:36 +0000, Yixun Lan wrote:
> > > Instead of grouping several different reset lines into one composite
> > > reset, decouple them to individual ones which make it more aligned
> > > with underlying hardware. And for DWC USB driver, it will match well
> > > with the number of the reset property in the DT bindings.
> > > 
> > > The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> > > PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> > > Also three reset lines each for UCIE and RCPU block.
> > > 
> > > As an agreement with maintainer, the reset IDs has been rearranged as
> > > contiguous number and pushed as a fix for the driver, and reason is that
> > > there isn't any consumer of reset driver so far,
> > 
> > Unfortunately that does not seem to be the case for all APMU resets.
> > A lore query for all changed IDs [1] yields a patch that adds ethernet
> > device nodes using RESET_APMU_EMAC[012] [2].
> > 
> Yes, although the ethernet use this ID, but I don't think we should worry
> about that, since the ethernet patch is still under review, and ideally it
> will be merged after this reordering patch, unless you disagree? and insist
> the RESET_APMU_EMAC should not be changed?
> 
To be precise, this reset patch will go in v7.0 as a bug fix, while the
ethernet DT patches target for next merge windown - v7.1 cycle

-- 
Yixun Lan (dlan)
