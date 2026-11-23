Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.154.119.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471121;
	b=sU77sB1QbMaAipZHuYNvr+4V5zkh/r/C7E1LJhLaf8PfBhEmtXTDN1X9kfaXv4D960So
	 c2yZceWOYwfXsgIKuyufE7IanHCMq/GfGUnMK5Dph3zD3yRpkn+X/jZvgpONKBOlv45m+
	 2Rq4I0UrUBpLD4/Z/WZLIG2++n0W/mcihtuLsrnwE11EnDPQJBXkwj+O7hf0DdsNzGsxo
	 Y6dlxxQq9QF1yIcVbTMt9sGoHwXKeGP2gP9t+B1GX6RVobZOCKzIaqG0QTddDoNhqd9Cf
	 Bs2F8cFqSnZKXemOtumdVJnf4mUoI/79ZmBs/KUMynKeEVd0TXmw38y1v/Pj9bS4e3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471121;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:User-Agent;
	bh=HA56YBnBjS6ejjIegWe0iNjtvEk49TWfG37iY7fhSAs=;
	b=cyk+5le+CZ8p2zg8nbhF/8XKhoIDsgFmftvBm5c17/BYvTfl8PH5Pd62qIFtAYwJmLVc
	 uw6qNybMKSI0mnNQIGrcKPWw26HwcK0kQ3NayjR5lZ7mMG9abns1LNAfYEIHkyvXZTdsw
	 vy1m5P9R18HWT8lCUuC6Eua/ym9u82ye770iwsZP+bqKPmflxAcg3HaCOFOSj/AD97JLw
	 D8MQzN0Zeh3bec1rz8ayjTiropaB1Z8wi+qLdc7mzrN6ox0vz0H7WQwpEoc1+FYq9yRzy
	 syGVcsCeRPbiMoR0F43cTHTAQLm1vtY+XtutiXk+sgUhJAgndeDVlT44ZwEJevIi+gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aurel32.net;
	spf=pass smtp.mailfrom=aurel32.net;
	dkim=pass header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=Bzeb5ZAI;
	arc=none smtp.remote-ip=195.154.119.183
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B548606A31E;
	Mon, 23 Nov 2026 21:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B548606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=Bzeb5ZAI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=HA56YBnBjS6ejjIegWe0iNjtvEk49TWfG37iY7fhSAs=; b=Bzeb5ZAI4Yqkb42m9BOTb1NStq
	HTC5LTHOhHzE2ag7ZZ3wr7VPMM69K4crX6gYwDZfpq+IjhvuAQvHH+sdw20sBjnql8wX76QYFp6ys
	1VwWvOUznFNLYc5811IAoJXjs6qH+Y2SzJmVPKCt6QnoftSwAuExGNiI8H3SsLyNPiZEJMpXH0s2E
	5gPhFW5XNapDa2GpKtQzoKxyjr8B31KjBRMnNUEHq1oaotgPgKmxbnpjKcap4AqZJQp30iz+yRjmL
	s7PK1Z3sw8Ng0GQatB78yyabk7eAKxTL8rHNAj56rqEaa20lFhyPR11+AaMIZNugGf/LnL64Z18Po
	9mxwD+BQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xVc3G-00000007ZxZ-09JF;
	Mon, 23 Nov 2026 22:58:18 +0100
Date: Mon, 23 Nov 2026 22:58:17 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
Message-ID: <awS2-clBenE1r1a1@aurel32.net>
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi,

On 2026-11-23 12:41, Zixian Zeng wrote:
> The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]:
> 256 bytes with an 8-byte write page, which can be found in schematic[2].
> The device tree declares pagesize = <16>, which does not match the
> eeprom chip datasheet which declares pagesize 8 bytes.

Oops, I am not sure how I got that wrong. Sorry about that.

> EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] changed
> together, based on the chip model shown in the schematic diagram.

The k1-milkv-jupiter board is also affected with the same issue, despite 
using a slightly different EEPROM (24C04).

> The TLV EEPROM on this board holds the base MAC address and the MAC count,
> so a corrupted write leaves both Ethernet ports without a MAC address,
> which is how this was found.
> 
> Link: https://www.giantec-semi.com/uploads/20230414/GT24C02B.pdf [1]
> Link: https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view?usp=sharing [2]
> Link: https://pan.baidu.com/s/13UTY_qM4gGuVxsZ9U7_Xpw?pwd=8888 [3]
> Link: https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnONSR?usp=sharing [4]
> Fixes: bfce75e2345f ("riscv: dts: spacemit: add 24c02 eeprom on BPI-F3")
> Fixes: 46a8c01700ac ("riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO board")
> Fixes: ac436e6879f5 ("riscv: dts: spacemit: enable onboard eeprom for OrangePi")
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>

Thanks for fixing that.

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
