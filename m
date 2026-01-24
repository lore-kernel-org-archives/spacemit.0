Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A6E146588
	for <spacemit@lists.linux.dev>; Sat, 24 Jan 2026 06:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769235914; cv=none; b=BXocV7bfAQJfpMiA/vUaqYaxQ8kkU8tZjMU1SYyfCmIUtPBlgnXVykpeRckJUO/HvuvaMhQ0TOpAjM4OfmPbtKsWJbbGucqxowjvnGnPQfXVLemetZfZLgAa9qnRsX/YIeuux/qT5pJIsmFTql3A02hGgCkNgAB4UefkLYUkgU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769235914; c=relaxed/simple;
	bh=tuFmIXR4ptFr0iyeEET7uJNT++l+8Ych6dqgmhccRUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZRJ1jTtQxm+C+BrZnMosAqWdOfMmHhtQ88B3yNk9fUvfSEHWBYK6FY8Ra7rJbiHz3y3WtcwR7Mt21YgkfC7XIqLnxf++ExglExijQJhGR910Kov8t4oaiS2/KXkR9TAq0EryOAqZx1fHrH14ofwAmX3qkKPFh7Y0//HayadoyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.0.108] (unknown [123.118.222.47])
	by APP-03 (Coremail) with SMTP id rQCowACHa+KhZXRphz94Bg--.7034S2;
	Sat, 24 Jan 2026 14:24:34 +0800 (CST)
Message-ID: <76bd53dd-0ca9-4358-a0b6-a49283e43c5f@iscas.ac.cn>
Date: Sat, 24 Jan 2026 14:24:33 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
To: Guodong Xu <guodong@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACHa+KhZXRphz94Bg--.7034S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr13Jr47ZFW7Zr4rtFWUJwb_yoW3Gwb_A3
	4Igas7Z3WkuFWa93Z7JFs0yF98Xa1jkFyavr1rJ348X34YkFykC3s2g3sIvr18Gr4UKr1D
	Wr4kKr4UAFnxKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbskYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU30PfDUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/


On 1/24/26 08:20, Guodong Xu wrote:
> [...]
>
> Note: Patch 3 introduces a bisect breakage by transitioning to
> pin-specific supply names. Probe failures will occur on existing boards
> until Patch 4 updates the corresponding DTS file.

Ouch, that's not a bisect breakage, that's an *ABI breakage*. And AFAICT
this is still not okay in 2026,
see Documentation/devicetree/bindings/ABI.rst

So the bindings would need to be changed to accept both the new and old way.

Driver-wise, at a cursory look from someone not familiar with the
regulator stuff, maybe we can make it compatible with old DTS by adding
the new names as aliases ({devm_,}regulator_register_supply_alias?) as
"vin" or "buck5", if we see the old vin-supply definitions?

