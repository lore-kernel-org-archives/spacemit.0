Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC212FE573
	for <spacemit@lists.linux.dev>; Mon,  3 Nov 2025 16:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762188150; cv=none; b=S/UYyJnnZtVBUPu7vQ2cFas6r/6+J6GUGngyl+Z2KyUi62KeOLaP4RZfdZNAGqS2Anc05FEWxNxHBeEy+A1Rti11dJCrBrTo00ePLvuirKYLbpp9c9nRJ3gNStzeKJaFUQcLtE3dE4B9UB9sRxZX+6cn84JserDkwijNnhfHSMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762188150; c=relaxed/simple;
	bh=OcaI3qwgeTCF0BR+/oUJ3XCKZ1BAXfflSEB1AM9BxUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jk12eztRmBuVVWN9kkMn45W7y5gLIiC38HVeroui+lo/3t0ZuLPYBR1zfdCUnTdgyh0BqpbshVbiQlYmwqnhSHSGhTYbUwSTHfN4AS7BeMll+IOlG5S5Xhvn7ZpaVS6EApaN+tq1cU24T9uAOx1PbRim9PToFJgL6leLA5BgND8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WC4Mo23g; arc=none smtp.client-ip=209.85.166.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WC4Mo23g"
Received: by mail-il1-f195.google.com with SMTP id e9e14a558f8ab-43326c748d5so6568105ab.0
        for <spacemit@lists.linux.dev>; Mon, 03 Nov 2025 08:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762188147; x=1762792947; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GHeoDcWtrtw4Kqs9i7E9yy2tKQ26ZOwu5ohkUo50ijM=;
        b=WC4Mo23garIRDSDnTicxstpLFzY72w8jHvXAhHGlUUHOiCRDojjjb0KT3d4t83HBA3
         yZ1SPrPzKWratZptI9Rau5AD7AHnLIdJoyiB+dx/jmmHb06ApfwQQ7yVw4fOaUnXy7vG
         evw7UkOGXEcQmGTPB2RvVqu/K4qxh1RVsv6FPs+NErZjOwlg6HqA7nSXUa79wXlA60LC
         6P35T5cj2I28/vcLgH068uEXGksYeaYSdDZFSu4lkG65q44bBZvytFvB9X4441MsFA1N
         Nn6R7hva+bxMRL9C+Gh11IxpRBmfc7NHxQJOHJHkW4Cx2MKFKyyM2rZnXVqTHCECltKw
         7pmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762188147; x=1762792947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHeoDcWtrtw4Kqs9i7E9yy2tKQ26ZOwu5ohkUo50ijM=;
        b=ui1S/Fu/gfXBvU73jcxOAPMDP0aMw9O3OKuKJDz+ccxi5cESPYQkGdpHvIvsEul6c5
         8qiSKVKzW2iHlISF8voJpV9NlAVBJAnUUM2dBn9E0UOReoEiYumBwKHz6re1BHtjCnz2
         WOwzma1kWSKyZkVC9KF7gYGgAuAzCp0qpYm51UY+upAFw554BGToRJ7M5RJjrKKeKKo8
         WMLpxrC3C5+qAx9VSYmM+NRgsJGFcie0dmaQSXhMCTkhEqf1krZTPvuq/vf1d7i4ZuNB
         9GatvUCge9TJuLHfVVYre7LJgYLtNckUGxM/2M6gRHyCGkwjO4n9XKNGdk/jxFP3EUJp
         iiHA==
X-Forwarded-Encrypted: i=1; AJvYcCVhvZnFbsUkLGGlViBphi1LDCkPv9rsIhDVyeP/ovQK3NFGOx+wOfGRHgy96VGgTYYyB0hF9GUjrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YweR+YSr8Nky3ZVpAHdm1n6S8WixGzqZhDwerPqO3N7HxCPWkZn
	Q/RGbMbjadVWJPzrYpfLfrk96N7gDcIieGa9aW1csR4+IOkYQ3qO7Xamh0iBGi0Uczk=
X-Gm-Gg: ASbGncvv8p768Xg5vvOLFNeizqoducYQYRiVqQHbpwklm9Hu3lCk5YN4W+MfHpbPng5
	P3e+iaB21Z/UnxhYi5K05FqViz61i2yO/GlkH+fB9RpOzjC2q09PYH9+JIdZjQouzTlfy6xzGSu
	EvLH3BowdIrRiTzuZvUEwtYtKULfX4TdsubnRMJo/cqujtyaxrsRPR7GFWfMwR8+YO8v8LbVgHm
	WTThQhknu3mclmucZGt9rBvt7CN7AiH7gqFkPOeiX9roy5ullL6f+hZbGG0ALEEYjP3Yx+Xd2U6
	/VH+b5azUWt4GK/+Vt/JC0SOqzISRgW7um7hRxHXTD00k1sR6JMMepwg0uP3nsKh6U2phoa5Krr
	60+BNZG7uusXTq1ywbxLwkObhAsSmWVFJiBvk+yZXX0xxBF3dyBW/hRf4A7kIB8Vw09blhiMQA9
	k0DD9UXziY1zulG9JOrSglWl9rJ7VCldytKZxZBRG0
X-Google-Smtp-Source: AGHT+IHkHY4VTZ7p5OKjtOgXuNnn4x75Ilvl4YEJ6q5B/6x6J8/6eBwuDTFeeDgt2AKvux4z5rFo4g==
X-Received: by 2002:a05:6e02:4603:b0:433:229c:351c with SMTP id e9e14a558f8ab-433377fbe1emr622165ab.1.1762188147419;
        Mon, 03 Nov 2025 08:42:27 -0800 (PST)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b7226f55edsm334467173.59.2025.11.03.08.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 08:42:26 -0800 (PST)
Message-ID: <35da84ab-5104-4fee-a7ea-4f3d42f7344a@riscstar.com>
Date: Mon, 3 Nov 2025 10:42:23 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Introduce SpacemiT K1 PCIe phy and host controller
To: Manivannan Sadhasivam <mani@kernel.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Cc: Johannes Erdfelt <johannes@erdfelt.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, vkoul@kernel.org,
 kishon@kernel.org, dlan@gentoo.org, guodong@riscstar.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <aPEhvFD8TzVtqE2n@aurel32.net>
 <92ee253f-bf6a-481a-acc2-daf26d268395@riscstar.com>
 <aQEElhSCRNqaPf8m@aurel32.net> <20251028184250.GM15521@sventech.com>
 <82848c80-15e0-4c0e-a3f6-821a7f4778a5@riscstar.com>
 <20251028204832.GN15521@sventech.com>
 <5kwbaj2eqr4imcaoh6otqo7huuraqhodxh4dbwc33vqpi5j5yq@ueufnqetrg2m>
 <aQOlMcI9jTdd7QNb@aurel32.net>
 <ywr66wfkfay3xse77mb7ddbga5nced4yg7dapiybj3p2yp2an2@7zsaj5one5in>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <ywr66wfkfay3xse77mb7ddbga5nced4yg7dapiybj3p2yp2an2@7zsaj5one5in>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/25 1:10 AM, Manivannan Sadhasivam wrote:
> On Thu, Oct 30, 2025 at 06:49:37PM +0100, Aurelien Jarno wrote:
>> Hi Mani,
>>
>> On 2025-10-30 22:11, Manivannan Sadhasivam wrote:
>>> + Aurelien
>>>
>>> On Tue, Oct 28, 2025 at 01:48:32PM -0700, Johannes Erdfelt wrote:
>>>> On Tue, Oct 28, 2025, Alex Elder <elder@riscstar.com> wrote:
>>>>> On 10/28/25 1:42 PM, Johannes Erdfelt wrote:
>>>>>> I have been testing this patchset recently as well, but on an Orange Pi
>>>>>> RV2 board instead (and an extra RV2 specific patch to enable power to
>>>>>> the M.2 slot).
>>>>>>
>>>>>> I ran into the same symptoms you had ("QID 0 timeout" after about 60
>>>>>> seconds). However, I'm using an Intel 600p. I can confirm my NVME drive
>>>>>> seems to work fine with the "pcie_aspm=off" workaround as well.
>>>>>
>>>>> I don't see this problem, and haven't tried to reproduce it yet.
>>>>>
>>>>> Mani told me I needed to add these lines to ensure the "runtime
>>>>> PM hierarchy of PCIe chain" won't be "broken":
>>>>>
>>>>> 	pm_runtime_set_active()
>>>>> 	pm_runtime_no_callbacks()
>>>>> 	devm_pm_runtime_enable()
>>>>>
>>>>> Just out of curiosity, could you try with those lines added
>>>>> just before these assignments in k1_pcie_probe()?
>>>>>
>>>>> 	k1->pci.dev = dev;
>>>>> 	k1->pci.ops = &k1_pcie_ops;
>>>>> 	dw_pcie_cap_set(&k1->pci, REQ_RES);
>>>>>
>>>>> I doubt it will fix what you're seeing, but at the moment I'm
>>>>> working on something else.
>>>>
>>>> Unfortunately there is no difference with the runtime PM hierarchy
>>>> additions.
>>>>
>>>
>>> These are not supposed to fix the issues you were facing. I discussed with Alex
>>> offline and figured out that L1 works fine on his BPI-F3 board with a NVMe SSD.
>>>
>>> And I believe, Aurelien is also using that same board, but with different
>>> SSDs. But what is puzzling me is, L1 is breaking Aurelien's setup with 3 SSDs
>>> from different vendors. It apparently works fine on Alex's setup. So it somehow
>>> confirms that Root Port supports and behaves correctly with L1. But at the same
>>> time, I cannot just say without evidence that L1 is broken on all these SSDs
>>> that you and Aurelien tested with.

Aurelien, can you please confirm that your reports are with the BPI-F3
board?  I believe you identified the three SSDs that were failing.  I
am considering buying one of those models to see if I can reproduce
the problem and troubleshoot it.

>> It could be that we have different revision of the BPI-F3 board, it's
>> not impossible that I got an early-ish version. That said I just
>> visually checked the PCB against the schematics, and the devices on the
>> CLKREQN line appear to be installed.
>>
> 
> CLKREQ# is only needed for L1 PM Substates (L1.1 and L1.2). In other ASPM states
> (L0s and L1), REFCLK is supposed to be ON. So those don't need CLKREQ# assertion
> by the endpoint.
> 
> The L1 issue you are facing could be due to the board routing issue also. I'm
> just speculating here.
> 
>> If someone has contacts to check what changes have been done between the
>> different board revision, that could help. Or same if there are
>> different revisions of the SpacemiT K1 chip.
>>
> 
> I hope Alex can get this information.

I have sent a message to SpacemiT to explain that these issues are
being reported, and asking for any useful information about the
BPI-F3 (including whether there are different versions, or different
versions of firmware, and how someone can identify what they have).

Thanks.

					-Alex

> - Mani
> 

