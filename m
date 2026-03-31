Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70E745349F;
	Tue, 31 Mar 2026 21:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774992891; cv=none; b=dfRa7Aou9sSyvilzWGZRv+ryRoKMl60R2io4Yf5IT9ozjijKLt0TkR/0EnVN0pPVNBbiYkDRwhcL54QMgK+E3mX1xZfg9WedKzLzEiBHfH6ZRBTHclByod3Fv9N36FfplJobjRCj7XCN6U12wPXr7lmpbXPdodpdKmhKnNsyfsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774992891; c=relaxed/simple;
	bh=4wR4QylHcmskmt0KG5ly6sLWoHv46ssVh2JkVA+U+Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZquhFSo7AtIyunq3WURMI5yU3Qo2f9DhPi0LDWZaxzsnJwrp3gMUrCl6/q3Js7c7+99MG4wlYd4hzG0uUAVzDGUcIq5td3D66PDX8A4SoSm3ABDX0nEasGixtZ68l2CQRYDvDxcZddPGWgSs57tqm1aDkJDUuFAVebel9MFHvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRNSCFvA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRNSCFvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774992890; x=1806528890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4wR4QylHcmskmt0KG5ly6sLWoHv46ssVh2JkVA+U+Bk=;
  b=BRNSCFvAohJ3xX6TW7mIg8GMTWiyz2ZO/m0Opg+Quj/1sRoR1k3iTf7Z
   cZ1Gq0seGsSQplTnhp4XPjl2ADpvFOa3MzYspX4ZWWMZKvww8/TqzZGvx
   fyNQDM7a1EkxyZZrZFLJGdl/73IJc1ke2v7S671XkmYat5FfCQ4TTm9qd
   mDaaUYlkfBVWzvHhf3bjdQGvvaSCeH9TA1cnS9FQsOpMY0khLFwYcfN/p
   BlW37UODQCNDmu+3QhJLBe6yVasQ7/oIi1ooO3Yvu1TtDbEu9SKmrL3aU
   d2SUe3PHB8/u8aTbxwkdQmW4Eu8GRIsqeh9ErhidN+Vy9CuP9BUuTslzq
   g==;
X-CSE-ConnectionGUID: p9wqbk3nRHiUfWfL8ym31g==
X-CSE-MsgGUID: y2uRtYpUSkiFp3TqDLV67A==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75057559"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75057559"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 14:34:49 -0700
X-CSE-ConnectionGUID: KkhM+YH+RY6ZBfPW8wELwQ==
X-CSE-MsgGUID: Wtm6ipwaSxCfv+Lc/YJdbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226353128"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Mar 2026 14:34:47 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7gjT-000000004JB-2AzA;
	Tue, 31 Mar 2026 21:34:43 +0000
Date: Wed, 1 Apr 2026 05:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
Subject: Re: [PATCH v2] riscv: dts: spacemit: k3: Add USB2.0 support
Message-ID: <202604010550.sTNDXe0k-lkp@intel.com>
References: <20260330-02-k3-usb20-dts-v2-1-46af262fb4a9@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330-02-k3-usb20-dts-v2-1-46af262fb4a9@kernel.org>

Hi Yixun,

kernel test robot noticed the following build errors:

[auto build test ERROR on af62a095eb0c3359d477b55ef72d2afd94c83c8f]

url:    https://github.com/intel-lab-lkp/linux/commits/Yixun-Lan/riscv-dts-spacemit-k3-Add-USB2-0-support/20260331-231732
base:   af62a095eb0c3359d477b55ef72d2afd94c83c8f
patch link:    https://lore.kernel.org/r/20260330-02-k3-usb20-dts-v2-1-46af262fb4a9%40kernel.org
patch subject: [PATCH v2] riscv: dts: spacemit: k3: Add USB2.0 support
config: riscv-randconfig-002-20260401 (https://download.01.org/0day-ci/archive/20260401/202604010550.sTNDXe0k-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010550.sTNDXe0k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010550.sTNDXe0k-lkp@intel.com/

All errors (new ones prefixed by >>):

   Lexical error: arch/riscv/boot/dts/spacemit/k3.dtsi:446.27-46 Unexpected 'RESET_APMU_USB2_AHB'
   Lexical error: arch/riscv/boot/dts/spacemit/k3.dtsi:447.20-39 Unexpected 'RESET_APMU_USB2_VCC'
   Lexical error: arch/riscv/boot/dts/spacemit/k3.dtsi:448.20-39 Unexpected 'RESET_APMU_USB2_PHY'
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
