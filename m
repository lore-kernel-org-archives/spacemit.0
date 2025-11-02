Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5CB21ADCB;
	Sun,  2 Nov 2025 22:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762122333; cv=none; b=kQt6F2oeyws4OJMhGU3kG5mSw7VcUXIzH//CdA7uX4AihqoB+gT8HICpQQXy2WhYkgNcK2dMz0uNkcdMwOB4uO+Z02TrXVC5HyLhuP+bZuoin7fear1h3DT3cYd73xztFpNsUq6Y9GOwue4ROmJTNI/Uc/i42KwvwVnuQA49x/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762122333; c=relaxed/simple;
	bh=xAaDVXcvzXMuT6b41jvj67zRq9dUreGowV9Fgs0NF0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WT9kW03oQR8qWivtzNvp0WZR/7ZuTNzQKsaumHMyAWXoZmWjcB1L2UBGUD/gCmw12QG+8Xl9GHd7DkjND5rxdC1tkLCn/h/psvG97L4KA7plW3WdwRDZPeshpg40nhPJGzeKJy+DhYhLFqe3DsKdl3iqv+lrpqgU4svnNFskKug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KN4y6alO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KN4y6alO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762122332; x=1793658332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xAaDVXcvzXMuT6b41jvj67zRq9dUreGowV9Fgs0NF0Y=;
  b=KN4y6alOBPr+QnnkpvT0Jfnwnf+i+gtVGxOxl03hEHueO6YsAuJ92/29
   GXL+mUVDN4+hmcBMuRO/Kz2jguqBm7f7Dz31GTpBEJtJfudKL8OATFRVJ
   fg1dkE5kC1YVOkuK1K/JtP/t+2r6pNywtmvUCTSv2TjfjWzSPFf6kxaf9
   /y8KQhNT4XlwXsAI+QScVYmFKgNWPfezCTT5ylYiYHYgibRgkWYDZw7uj
   785crRJWK1fiVok+Iq81hOod6D+hmibaefdM3n3tnnAj5Q6PEBQYyvvfh
   Sdzl28VTrKsrZfJKOYd0A/AP7MUc86nU6nEHzXTLBJi+5E2NIPqTweOet
   A==;
X-CSE-ConnectionGUID: BuDp7+X3Rl+qeHMKco+BSg==
X-CSE-MsgGUID: mJ+ln8S1TSaPECZMVGYV8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="68062718"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="68062718"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 14:25:31 -0800
X-CSE-ConnectionGUID: vXJAcFdIRR2J+3k8618sjw==
X-CSE-MsgGUID: gfzfgI3ESyqPmcXpTmfFfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="186593785"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Nov 2025 14:25:28 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFgVq-000PcC-1p;
	Sun, 02 Nov 2025 22:25:26 +0000
Date: Mon, 3 Nov 2025 06:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>, vkoul@kernel.org, kishon@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de, dlan@gentoo.org,
	aurelien@aurel32.net, guodong@riscstar.com,
	linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: Re: [PATCH v4 4/7] phy: spacemit: introduce PCIe/combo PHY
Message-ID: <202511030652.3CVPb2v3-lkp@intel.com>
References: <20251030220259.1063792-5-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030220259.1063792-5-elder@riscstar.com>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on 131f3d9446a6075192cdd91f197989d98302faa6]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-phy-spacemit-add-SpacemiT-PCIe-combo-PHY/20251031-060541
base:   131f3d9446a6075192cdd91f197989d98302faa6
patch link:    https://lore.kernel.org/r/20251030220259.1063792-5-elder%40riscstar.com
patch subject: [PATCH v4 4/7] phy: spacemit: introduce PCIe/combo PHY
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20251103/202511030652.3CVPb2v3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030652.3CVPb2v3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030652.3CVPb2v3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_clk_hw_register" [drivers/phy/phy-spacemit-k1-pcie.ko] undefined!
>> ERROR: modpost: "devm_clk_hw_get_clk" [drivers/phy/phy-spacemit-k1-pcie.ko] undefined!
ERROR: modpost: "clk_save_context" [drivers/net/phy/air_en8811h.ko] undefined!
ERROR: modpost: "clk_restore_context" [drivers/net/phy/air_en8811h.ko] undefined!
ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
