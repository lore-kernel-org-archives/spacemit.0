Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234722E06E4
	for <spacemit@lists.linux.dev>; Sun,  1 Feb 2026 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769932509; cv=none; b=NAlEhGm94wzBU7bWciWcu8DDudjSHIyetNLqwKcazNauLuvolsM3ziaNu6qcjkNOMUdCqFeRKKnO3jqvDTg4oi2IwVzJ9gByjpgNX/TKSQk9vAnBEPNhn0TnayTbQds7ZWljtGkSWEmysSEM2ARUWHVJpUmkC2yhARc19x6OM14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769932509; c=relaxed/simple;
	bh=z6mWxDqFM4sMz0Ku7c7Hx1Zh61VJbVlC9psNnYXmEpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjpmtN5fwYllx5eDC5WdtgmBA9rmW64fTLZMrUOQ+71AVKk15tDyzpD2bt+0Y/L1f1zMpBtyU/EP4np7dYNbo9S0YNlCd+do410+ZTMznq/d2tbFc/Sw+5mcI8x74EB0VCxWvPH9J1SnqKZ0gY3SQpE5ga85fqls0IE48s4Ktos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.0.111] (unknown [123.118.222.47])
	by APP-01 (Coremail) with SMTP id qwCowABnEm7FBn9pTAnlBg--.4747S2;
	Sun, 01 Feb 2026 15:54:46 +0800 (CST)
Message-ID: <d994ec8a-ff6a-4228-bfc9-2fcf9b35a460@iscas.ac.cn>
Date: Sun, 1 Feb 2026 15:54:45 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] riscv: dts: spacemit: Add PMIC regulators usb pcie
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
References: <cover.1769895215.git.gaohan@iscas.ac.cn>
 <176992308158.607015.13478428408379130887@lemur>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <176992308158.607015.13478428408379130887@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABnEm7FBn9pTAnlBg--.4747S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurWfWrWUJrWDtFy7Gw47CFg_yoW5Ww43pa
	1F9wn3Kr1Dtrn7C3s2v3WxXFyS9w4kWF98Xr98Wr1kZa1rXayxtrySka15ua4UCryrCw4j
	qrZFkr93CF9xAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

On 2/1/26 13:18, Konstantin Ryabitsev wrote:
> On Sun, 01 Feb 2026 05:38:07 +0800, Han Gao <gaohan@iscas.ac.cn> wrote:
>> This patch series enables the PMIC, voltage regulators, usb and pcie
>> for the OrangePi rv2 board.
> Hi:
>
> Thank you for sending this in. I am working on "b4 review" functionality 
> and I am using arbitrary series to perform agent-assisted reviews to 
> find bugs in the process.
>
> This review was done by Claude Opus 4.5. I do not know enough about the 
> subsystem to make any judgment about the quality of these reviews, but 
> they look valid enough.

I'm not sure if you see this, but your bot gave two contradictory
recommendations.

On patch 3 it says:

> This vin-supply is replaced by per-rail supplies (vin1-supply through
> vin6-supply, aldoin-supply, dldoin1-supply, dldoin2-supply) in patch
> 5/7.  Consider using the final supply properties here directly to avoid
> an intermediate state that is immediately superseded.
Whereas on patch 5 it says

> These per-rail supply properties (vin1-supply through dldoin2-supply)
> are not declared in the spacemit,p1.yaml binding, which only has
> vin-supply.  With unevaluatedProperties: false on the PMIC node, these
> will cause dtbs_check failures.  The binding needs to be updated to
> match, or these should remain as the single vin-supply.
"Use vin1-supply through dldoin2-supply, not vin-supply" and "use
vin-supply only, not vin1-supply etc" can't both be correct, so
obviously something weird is going on.

So what on earth is going on? Granted, Han could have described it
better in his cover letter, but there's a proposed update to the
spacemit,p1 bindings [1] that would have deprecated vin-supply and
allowed vin1-supply etc. So there's a dependency in this series of
something like:

    patch 1,2 -> patch 3 -> bindings update [1] -> patch 5

If/when the bindings update is accepted, patch 5 can be accepted into
the DTS tree. Until then, patch 5 should be withheld.

This isn't obvious from the patch itself, but still, the two
recommendations are contradictory on their own, and make dtbs_check
(mentioned in the patch 5 comment!) would have caught the problem with
the patch 3 comment. 

> Hopefully, these were useful. If not, I am sorry for wasting your time.

I acknowledge that this is a sample size of 1, but this is not making me
feel inclined to trust the future of whatever "agent-assisted review" is
going to be happening. What good is an "agent" if it knows about make
dtbs_check but doesn't even run it to see what would happen to its
suggested fixes?

I don't know what you have in mind for "b4 review", but I think at the
very least, "b4 review" should not encourage "I do not know much about
the subsystem but the LLM comments look valid" replies.

Regards,
Vivian "dramforever" Wang

[1]: https://lore.kernel.org/spacemit/20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com/

