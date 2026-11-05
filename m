Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793847144;
	b=KugwF9szOcPKkzaR4b2FGdWw6iPsLUHiGRyM8p5Nn+rIjkLkU5CpDQkM4szGLDfO0oAU
	 jxkbXw+UNwZr68s89an3wV3ayZv5sbC57HGS+XVz9WVQaDPImUWbFb1LX6ldbCZ+lpkYo
	 hZ/clKWNfg6undbWVU6lhL0GOMPeBvX8ptRLrnmK5CRaE1XCFsnavYAdLqyl+5gNIUwn0
	 KSoe48gQJP9flVUvv3HLYpkCWPgk2NaSYEhs+nXSMZYTYPkNURM1IocEWTuvf8PihfQV2
	 owvS0maki3y46j9wbybEYuSkUqQonEGVpOKA/LrYZPVjUQIoWMC6NYVf6Cxe4XFCwIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847144;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=pSQlM765W4jXpSl/SCbV9elszf49mnxaxw8VUy+qP6Y=;
	b=4srMBdm2Vra3UI3WFym0aVO8KSzwz/RzyPx1uhix4FOmg6hZ/YWBkr27y8eIWMkhOZkl
	 lNTl7DKlm/jDUIEJK2dZIl8NlWa/UedwzE0rAe1WYxgjMNGUkNsF+p++rFHLvIPMRlIub
	 i1/oideFXuKQnfm6UH10g/jBKEJU/hCBGf4xdfORSrxNKKgHGjV5oK+6AOelSrNK6AX+U
	 mNP/RAqf2iUqwzb7McfHDfuRCrNxRrnHs/bFnqZu4KSRjUlndPuGRMq8LsCKjipIzUohp
	 dpyV8bEmOByBb2kA+oEftpjfzFMLzW9/pLFnUzLNaTf/OqhaZnulOgtkXxABBVXYAww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=YbuxoscO;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19462606A326
	for <spacemit@lists.linux.dev>; Thu,  5 Nov 2026 02:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19462606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=YbuxoscO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793847104;
	bh=pSQlM765W4jXpSl/SCbV9elszf49mnxaxw8VUy+qP6Y=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=YbuxoscOgHThcRxXOdh5gkG3Lny9wK/JJF1vTgfTEFROLzZSJPMaaLzG2MHqyVAhr
	 imQeRgQzLBvLyMDC2av1s8+r7ucRVr6EJAHmFqBwxB1pFkadAM/dhGWDnMcWgQYP9I
	 OWT/CqlqL1zJ5QlEwanFGkyzQMzuXL2nd0r7Kdyo=
X-QQ-mid: zesmtpsz2t1793847097t2b788bd9
X-QQ-Originating-IP: BDByG9NYEZlnDz7mxM6v9n2dhLlOWgRPpDEX+pHQrWk=
Received: from localhost ( [8.218.183.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 10:51:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14892018786734316387
EX-QQ-RecipientCnt: 13
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 10:51:35 +0800
Message-Id: <DMMXQ358UWUZ.35H3HEEEUW1V8@linux.spacemit.com>
Cc: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Yixun Lan" <dlan@kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, <linux-pci@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: spacemit: Ignore link partner PERST on K1
From: "Encrow Thorne" <encrow.thorne@linux.spacemit.com>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>,
 "Encrow Thorne" <encrow.thorne@linux.spacemit.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20260924-spacemit-k1-pcie-fix-v1-1-002b5c1ba9fc@linux.spacemit.com> <179229759512.2114.3306580489141327360.b4-reply@b4>
In-Reply-To: <179229759512.2114.3306580489141327360.b4-reply@b4>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M182XWJxg1fqJITtHxQLvebLEkcMXiMjIGfbBAk+TLCRDofSVABmYl36
	aPmcxYs2y8KTHrbh4DpiBhapUf0M693EZ5yQ3BpC1/yngov892HyLbnCrm/IveR64wu15wH
	lEsGXC66HuXIgZAw2Jr0p4HR//ajNazw2UeZQ+AmY/BydtEJtVQuQw/m23uV53lYE5VJfji
	lUftQjmFcGMy8Fw9m3JjtNbNJSwmqF8z5N1cSBqF1IWAI9hX2yBJjXMtqw6gZfSqfHzpVo5
	MK7k2BmcZcAqve79OL/udxyyzTp1a9oyG75hig83kzSUTUb+4mBns5PUfz3RxkRUdSHwUkz
	iRrJRcFUXMimPlxBtP1ioW5+u7GqiPAXEOdH/1AmC4P/i/xvf1VCCpOzU2RCvJBOb/rdQT2
	bwGYkrqIAc/xMZgYb702DXS0bzDGINvg1AOWoBWsv0RDO8gxkrfUnE62l090SXtpe8JC7CX
	dBRAA/gs99RWEC+c6MB6/Ln6S39fWRAQURcinR6UHX03Vv76Rx5wcfWWLyabfv+jRs4tqik
	KsVSIo10WW5XllOk4DWVmY+NtXsrXXIkjduyAIE6ZS6Aflho/5ionKNCztg2f/KBvPKouwp
	bAWzJO9qN+w2J7xRBrnMMYDbquo4YMv/gmYdI5nz9wEm4HcTYzBcazJMJAXnzFm5Je4b60O
	kr2Em8yZfWN0+cnIQvHvjdtBKYTE94by5lVkvIVUg4jOM37CojWCXZtJtHYNRXqaTLwBKxZ
	APAetXi864MU5ZwD+/3TZ2awTNqVlR1u5xybP1nsqipt9+ISFOdEoQLoj1xS8zuFxJJCXL+
	pGSI7HvIZ2lUAkSnkWMGbd1OQajzXUxAXbuB1MXpilDB5+0WDlzUK+kvmAzdqMAPpTk+nlP
	Z7OpbRS4mB7Lo3aPngJnly+G8C/koLudDkDhs7zCyxap0+x3VZ7PqmdAX5WhEd5yLI61Y8w
	utXHZCpwCl9nCtCiID+hwWhe11J4KJ/wGZpJgbJfVEOiZvsqlj3HLxj73
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

On Sun Oct 18, 2026 at 12:26 PM CST, Manivannan Sadhasivam wrote:
> On 2026-09-24 10:04 +0800, Encrow Thorne wrote:
>> The K1 PCIe controller and PHY are affected by the PERST signal from
>> the link partner during initialization. With some devices connected,
>> this can prevent host initialization from progressing and cause the
>> system to hang while probing the PCIe controller.
>>=20
>> Set PCIE_IGNORE_PERSTN before accessing the DBI registers. When set,
>> this bit makes both the PCIe controller and PHY ignore the PERST
>> signal from the link partner.
>>=20
>> This allows host initialization to complete without being affected by
>> the link partner's PERST state.
>>=20
>> Signed-off-by: Encrow Thorne <encrow.thorne@linux.spacemit.com>
>> ---
>>  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>=20
>> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci=
/controller/dwc/pcie-spacemit-k1.c
>> index 0564c46e2f48..98f067e1ba81 100644
>> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
>> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
>> @@ -44,6 +44,7 @@
>> =20
>>  #define PCIE_CONTROL_LOGIC			0x0004
>>  #define PCIE_SOFT_RESET			BIT(0)
>> +#define PCIE_IGNORE_PERSTN			BIT(2)
>> =20
>>  struct k1_pcie {
>>  	struct dw_pcie pci;
>> @@ -137,6 +138,13 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
>>  	if (ret)
>>  		return ret;
>> =20
>> +	/*
>> +	 * When set to 1, the PCIe controller and PHY ignore the PERST signal
>> +	 * from the link partner in both RC and EP modes.
>> +	 */
>
Hi Mani

> What? PERST# is an output signal to RC and input to Endpoint. PERST# is n=
ot
> controlled by the Endpoint, but only by the RC/host.
>
> - Mani

You are right; my earlier wording was misleading.

On K1, the PERST# pad input feeds back into the local controller's
internal reset input even in RC mode. Thus, the RC can reset itself
when asserting PERST# to reset the endpoint.

PCIE_IGNORE_PERSTN masks this input path without affecting the
RC's control of the external PERST# signal.

Regards,
Encrow Thorne
